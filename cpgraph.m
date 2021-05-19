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

colormap = parula;
c = size(colormap, 1);

if coordinate==1

for n=1:3
    
data=cpdata(cpdata(:, 3) == n, :);

u=unique(round(data(:, 1), grouping));
uc=unique(round(cpdata(:, 1), grouping));
ucn=round(normalize(uc, 'range')*(c-1)+1);

figure(n)
hold on
for i=1:numel(u)
plot(data(round(data(:, 1), grouping) == u(i), 2), data(round(data(:, 1), grouping) == u(i), 4), 'o-', 'color', colormap(ucn(uc==u(i)), :), 'markerfacecolor', colormap(ucn(uc==u(i)), :))
end
if singlerotor
    plot([min(cpdata(:, 2))-5 max(cpdata(:, 2))+5], [0.3451 0.3451], 'r--', 'linewidth', 1)
end
legend([strcat('S=', string(u),'D');"Single rotor"], 'location', 'best', 'fontsize', 7);
xlabel('β(deg)')
ylabel('Cp')
title(sprintf('Rotor %d', n))
grid on
set(gcf, 'position', [430*(n-1)+100 450 400 300])
axis([min(cpdata(:, 2))-5 max(cpdata(:, 2))+5 min(cpdata(:, 4))-0.01 max(cpdata(:, 4))+0.01])

end

for n=1:3
    
data=cpdata(cpdata(:, 3) == n, :);

u=unique(round(data(:, 2), grouping));
uc=unique(round(cpdata(:, 2), grouping));
ucn=round(normalize(uc, 'range')*(c-1)+1);

figure(n+3)
hold on
for i=1:numel(u)
plot(data(round(data(:, 2), grouping) == u(i), 1), data(round(data(:, 2), grouping) == u(i), 4), 'o-', 'color', colormap(ucn(uc==u(i)), :), 'markerfacecolor', colormap(ucn(uc==u(i)), :))
end
if singlerotor
    plot([min(cpdata(:, 1))-0.5 max(cpdata(:, 1))+0.5], [0.3451 0.3451], 'r--', 'linewidth', 1)
end
legend([strcat('β=', string(u),'°'); "Single rotor"], 'location', 'best', 'fontsize', 7);
xlabel('S(D)')
ylabel('Cp')
title(sprintf('Rotor %d', n))
grid on
set(gcf, 'position', [430*(n-1)+100 50 400 300])
axis([min(cpdata(:, 1))-0.5 max(cpdata(:, 1))+0.5 min(cpdata(:, 4))-0.01 max(cpdata(:, 4))+0.01])

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
ucn=round(normalize(uc, 'range')*(c-1)+1);

figure(n)
hold on
for i=1:numel(u)
plot(data(round(data(:, 1), grouping) == u(i), 2), data(round(data(:, 1), grouping) == u(i), 4), 'o-', 'color', colormap(ucn(uc==u(i)), :), 'markerfacecolor', colormap(ucn(uc==u(i)), :))
end
if singlerotor
    plot([min(cpdata(:, 2))-1 max(cpdata(:, 2))+1], [0.3451 0.3451], 'r--', 'linewidth', 1)
end
legend([strcat('x=', string(u), 'D');"Single rotor"], 'location', 'best', 'fontsize', 7);
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
ucn=round(normalize(uc, 'range')*(c-1)+1);

figure(n+3)
hold on
for i=1:numel(u)
plot(data(round(data(:, 2), grouping) == u(i), 1), data(round(data(:, 2), grouping) == u(i), 4), 'o-', 'color', colormap(ucn(uc==u(i)), :), 'markerfacecolor', colormap(ucn(uc==u(i)), :))
end
if singlerotor
    plot([min(cpdata(:, 1))-1 max(cpdata(:, 1))+1], [0.3451 0.3451], 'r--', 'linewidth', 1)
end
legend([strcat('y=', string(u), 'D');"Single rotor"], 'location', 'best', 'fontsize', 7);
xlabel('x(D)')
ylabel('Cp')
title(sprintf('Rotor %d', n))
grid on
set(gcf, 'position', [430*(n-1)+100 50 400 300])
axis([min(cpdata(:, 1))-1 max(cpdata(:, 1))+1 min(cpdata(:, 4))-0.01 max(cpdata(:, 4))+0.01])

end

end