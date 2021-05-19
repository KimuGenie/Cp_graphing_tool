clear
close all


%input data%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
coordinate=2;
% 1.S-beta  2.x-y

singlerotor=1;
%Single rotor의 Cp를 같이 표시하려면 1, 아니면 0

grouping=1;
%좌표값을 소숫점 아래로 지정한 자릿수까지 반올림해서 같은 그룹으로 묶음

export=0;
%그래프 사진을 내보내려면 1, 아니면 0 켜면 오래걸림
%이전 사진을 덮어쓰므로 주의
%pictures 폴더에 저장되고, 폴더를 지우면 사진을 내보낼 수 없으니 주의

%figure size
figwidth=500;
figheight=300;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


load('cpdata.mat');
cpdata=sortrows(cpdata);

colormap = parula;
c = size(colormap, 1);

path=pwd;

if coordinate==1

for n=1:3
    
data=cpdata(cpdata(:, 3) == n, :);

u=unique(round(data(:, 1), grouping));
uc=unique(round(cpdata(:, 1), grouping));
ucn=round(normalize(uc, 'range')*(c-1)+1);

xl=round(min(cpdata(:, 2)), -1)-10;
xu=round(max(cpdata(:, 2)), -1)+10;
yl=round(min(cpdata(:, 4)), 1)-0.02;
yu=round(max(cpdata(:, 4)), 1)+0.02;

figure(n)
hold on

for i=1:numel(u)
plot(data(round(data(:, 1), grouping) == u(i), 2), data(round(data(:, 1), grouping) == u(i), 4),...
    'o-', 'color', colormap(ucn(uc==u(i)), :), 'markerfacecolor', colormap(ucn(uc==u(i)), :))
end

if singlerotor
    plot([xl xu], [0.3451 0.3451], 'r--', 'linewidth', 1)
end

legend([strcat('S=', string(u),'D');"Single"], 'location', 'eastoutside', 'fontsize', 7);
xlabel('β(deg)')
ylabel('Cp')
title(sprintf('Rotor %d', n))
grid on
set(gcf, 'position', [10+(10+figwidth)*(n-1) 50 figwidth figheight])
axis([xl xu yl yu])

if export
    saveas(gcf, path+"\pictures\beta-Cp rotor"+n+".png")
end

end

for n=1:3
    
data=cpdata(cpdata(:, 3) == n, :);

u=unique(round(data(:, 2), grouping));
uc=unique(round(cpdata(:, 2), grouping));
ucn=round(normalize(uc, 'range')*(c-1)+1);

xl=round(min(cpdata(:, 1)))-0.5;
xu=round(max(cpdata(:, 1)))+0.5;

figure(n+3)
hold on

for i=1:numel(u)
plot(data(round(data(:, 2), grouping) == u(i), 1), data(round(data(:, 2), grouping) == u(i), 4),...
    'o-', 'color', colormap(ucn(uc==u(i)), :), 'markerfacecolor', colormap(ucn(uc==u(i)), :))
end

if singlerotor
    plot([xl xu], [0.3451 0.3451], 'r--', 'linewidth', 1)
end

legend([strcat('β=', string(u),'°'); "Single"], 'location', 'eastoutside', 'fontsize', 7);
xlabel('S(D)')
ylabel('Cp')
title(sprintf('Rotor %d', n))
grid on
set(gcf, 'position', [10+(10+figwidth)*(n-1) 120+figheight figwidth figheight])
axis([xl xu yl yu])

if export
    saveas(gcf, path+"\pictures\S-Cp rotor"+n+".png")
end

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

xl=round(min(cpdata(:, 2)))-1;
xu=round(max(cpdata(:, 2)))+1;
yl=round(min(cpdata(:, 4)), 1)-0.02;
yu=round(max(cpdata(:, 4)), 1)+0.02;

figure(n)
hold on

for i=1:numel(u)
plot(data(round(data(:, 1), grouping) == u(i), 2), data(round(data(:, 1), grouping) == u(i), 4),...
    'o-', 'color', colormap(ucn(uc==u(i)), :), 'markerfacecolor', colormap(ucn(uc==u(i)), :))
end

if singlerotor
    plot([xl xu], [0.3451 0.3451], 'r--', 'linewidth', 1)
end

legend([strcat('x=', string(u), 'D');"Single"], 'location', 'eastoutside', 'fontsize', 7);
xlabel('y(D)')
ylabel('Cp')
title(sprintf('Rotor %d', n))
grid on
set(gcf, 'position', [10+(10+figwidth)*(n-1) 50 figwidth figheight])
axis([xl xu yl yu])

if export
    saveas(gcf, path+"\pictures\y-Cp rotor"+n+".png")
end

end

for n=1:3
    
data=cpdata(cpdata(:, 3) == n, :);

u=unique(round(data(:, 2), grouping));
uc=unique(round(cpdata(:, 2), grouping));
ucn=round(normalize(uc, 'range')*(c-1)+1);

xl=round(min(cpdata(:, 1)))-1;
xu=round(max(cpdata(:, 1)))+1;

figure(n+3)
hold on

for i=1:numel(u)
plot(data(round(data(:, 2), grouping) == u(i), 1), data(round(data(:, 2), grouping) == u(i), 4),...
    'o-', 'color', colormap(ucn(uc==u(i)), :), 'markerfacecolor', colormap(ucn(uc==u(i)), :))
end

if singlerotor
    plot([xl xu], [0.3451 0.3451], 'r--', 'linewidth', 1)
end

legend([strcat('y=', string(u), 'D');"Single"], 'location', 'eastoutside', 'fontsize', 7);
xlabel('x(D)')
ylabel('Cp')
title(sprintf('Rotor %d', n))
grid on
set(gcf, 'position', [10+(10+figwidth)*(n-1) 120+figheight figwidth figheight])
axis([xl xu yl yu])

if export
    saveas(gcf, path+"\pictures\x-Cp rotor"+n+".png")
end

end

end