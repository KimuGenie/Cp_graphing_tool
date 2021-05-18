clear
close all


%input data%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
coordinate=1;
% 1. S-beta  2.x-y
singlerotor=1;
%single rotor의 Cp를 같이 표시하려면 1, 아니면 0
grouping=1;
%소수 몇 째 자리까지 반올림해서 같으면 같은 그룹으로 볼 것인지
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


load('cpdata.mat');
cpdata=sortrows(cpdata);

colormap = ["r", "b", "g", "c", "m", "y", "k", "[0.7 0.2 0.3]", "[0.2 0.5 0.7]", "[1 0.5 0]", "[0.5 0 1]"];


if coordinate==1

for n=1:3
    
data=cpdata(cpdata(:, 3) == n, :);

u=unique(data(:, 1));
uc=unique(cpdata(:, 1));

figure(n)
hold on
for i=1:numel(u)
plot(data(data(:, 1) == u(i), 2), data(data(:, 1) == u(i), 4), 'o-', 'color', colormap(uc == u(i)), 'markerfacecolor', colormap(uc == u(i)))
end
if singlerotor
    plot([min(cpdata(:, 2))-5 max(cpdata(:, 2))+5], [0.3451 0.3451], 'r--', 'linewidth', 1)
end
legend([strcat('S=', string(u),'D');"Single rotor"], 'location', 'best');
xlabel('β')
ylabel('Cp')
title(sprintf('Rotor %d', n))
grid on
set(gcf, 'position', [430*(n-1)+100 450 400 300])
axis([min(cpdata(:, 2))-5 max(cpdata(:, 2))+5 min(cpdata(:, 4))-0.01 max(cpdata(:, 4))+0.01])

end

for n=1:3
    
data=cpdata(cpdata(:, 3) == n, :);

u=unique(data(:, 2));
uc=unique(cpdata(:, 2));

figure(n+3)
hold on
for i=1:numel(u)
plot(data(data(:, 2) == u(i), 1), data(data(:, 2) == u(i), 4), 'o-', 'color', colormap(uc == u(i)), 'markerfacecolor', colormap(uc == u(i)))
end
if singlerotor
    plot([min(cpdata(:, 1))-1 max(cpdata(:, 1))+1], [0.3451 0.3451], 'r--', 'linewidth', 1)
end
legend([strcat('β=', string(u)); "Single rotor"], 'location', 'best');
xlabel('S(D)')
ylabel('Cp')
title(sprintf('Rotor %d', n))
grid on
set(gcf, 'position', [430*(n-1)+100 50 400 300])
axis([min(cpdata(:, 1))-1 max(cpdata(:, 1))+1 min(cpdata(:, 4))-0.01 max(cpdata(:, 4))+0.01])

end

else

x = cpdata(:, 1).*cos(deg2rad(cpdata(:, 2)));
y = cpdata(:, 1).*sin(deg2rad(cpdata(:, 2)));

cpdata(:, 1) = x;
cpdata(:, 2) = y;

for n=1:3
    
data=cpdata(cpdata(:, 3) == n, :);

u=unique(round(data(:, 1), grouping));
uc=unique(round(cpdata(:, 1), grouping));

figure(n)
hold on
for i=1:numel(u)
plot(data(round(data(:, 1), grouping) == u(i), 2), data(round(data(:, 1), grouping) == u(i), 4), 'o-', 'color', colormap(uc == u(i)), 'markerfacecolor', colormap(uc == u(i)))
end
if singlerotor
    plot([min(cpdata(:, 2))-1 max(cpdata(:, 2))+1], [0.3451 0.3451], 'r--', 'linewidth', 1)
end
legend([strcat('x=', string(u), 'D');"Single rotor"], 'location', 'best');
xlabel('y(D)')
ylabel('Cp')
title(sprintf('Rotor %d', n))
grid on
set(gcf, 'position', [430*(n-1)+100 450 400 300])
axis([min(cpdata(:, 2))-1 max(cpdata(:, 2))+1 min(cpdata(:, 4))-0.01 max(cpdata(:, 4))+0.01])

end

for n=1:3
    
data=cpdata(cpdata(:, 3) == n, :);

u=unique(round(data(:, 2), grouping));
uc=unique(round(cpdata(:, 2), grouping));

figure(n+3)
hold on
for i=1:numel(u)
plot(data(round(data(:, 2), grouping) == u(i), 1), data(round(data(:, 2), grouping) == u(i), 4), 'o-', 'color', colormap(uc == u(i)), 'markerfacecolor', colormap(uc == u(i)))
end
if singlerotor
    plot([min(cpdata(:, 1))-1 max(cpdata(:, 1))+1], [0.3451 0.3451], 'r--', 'linewidth', 1)
end
legend([strcat('y=', string(u), 'D');"Single rotor"], 'location', 'best');
xlabel('x(D)')
ylabel('Cp')
title(sprintf('Rotor %d', n))
grid on
set(gcf, 'position', [430*(n-1)+100 50 400 300])
axis([min(cpdata(:, 1))-1 max(cpdata(:, 1))+1 min(cpdata(:, 4))-0.01 max(cpdata(:, 4))+0.01])

end

end