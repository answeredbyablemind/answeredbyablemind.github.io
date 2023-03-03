%{
Original Author: keizikang
https://github.com/keizikang
Date: Mar-03-2023

%} 
clear; close all; clc;

a = 4;
b = 1.5;
c = 1.5;
d = 3;

lightgreen = [144, 238, 144]/255;
lightblue = [169, 190, 228]/255;
lightorange = [247, 195, 160]/255;

anim_Nsteps = 30;
t_pause = 0.005;

figure('position', [206, 269, 921, 548],'color','w')
ax = axes;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
ax.XTick = [];
ax.YTick = [];

hold on
ax.XLim = [-.4, a+3];
ax.YLim = [-.4, d+3];

area = patch([0, a, a+c, c], [0, b, b+d, d], lightgreen);
p_ab = plot(a, b, 'ko', 'MarkerFaceColor', 'k');
p_cd = plot(c, d, 'ko', 'MarkerFaceColor', 'k');
p_ab.UserData = text(a+0.1, b, '(a, b)', 'FontSize',16);
p_cd.UserData = text(c+0.1, d-0.2, '(c, d)', 'FontSize',16);
area.UserData = text((a+c)/2-0.5, (b+d)/2, 'ad-bc', 'FontSize', 18);

pause(1)

%%

area.UserData.String = 'ad-bc...?';

pause(1)
%%

fadeinout(area, 0)
area.UserData.Visible = 'off';

pause(1)

%%

rect_ad = patch([0, a, a, 0], [0, 0, d, d], lightblue, 'EdgeAlpha', 0, 'FaceAlpha', 0);
uistack(rect_ad, 'bottom');
grid_xa = xline(a, '--', 'Alpha', 0);
grid_yd = yline(d, '--', 'Alpha', 0);

fadeinout([rect_ad, grid_xa, grid_yd], [1, 1, 1], t_pause=0.002)

rect_ad.UserData = text(mean(rect_ad.XData), mean(rect_ad.YData), 'ad', 'FontSize', 20, 'HorizontalAlignment', 'center');

pause(1)

%%

rect_bc = patch([0, c, c, 0], [0, 0, b, b], lightorange, 'EdgeAlpha', 0, 'FaceAlpha', 0);
grid_xc = xline(c, '--', 'Alpha', 0);
grid_yb = yline(b, '--', 'Alpha', 0);

fadeinout([rect_bc, grid_xc, grid_yb], [1, 1, 1], t_pause=0.0025)

rect_bc.UserData = text(b/2, c/2, 'bc', 'FontSize', 20, 'HorizontalAlignment', 'center');

pause(1)

%%

patch_slide(rect_ad, ...
    [0, 0, 0, 0], [0, b, b, 0])

grid_00_ab = plot([ax.XLim(1), ax.XLim(2)], [ax.XLim(1)*b/a, ax.XLim(2)*b/a], 'k--');
grid_0d = plot([ax.XLim(1), ax.XLim(2)], [ax.XLim(1)*b/a+d, ax.XLim(2)*b/a+d], 'k--');

pause(1)

%%

patch_slide(rect_ad, ...
    [0, 0, d/(d/c-b/a), d/(d/c-b/a)],...
    [0, 0, b/a*d/(d/c-b/a), b/a*d/(d/c-b/a)], t_pause=0.004)

grid_00_cd = plot([ax.YLim(1)*c/d, ax.YLim(2)*c/d], [ax.YLim(1), ax.YLim(2)], 'k--');
grid_ab = plot([ax.YLim(1)*c/d+a-b*c/d, ax.YLim(2)*c/d+a-b*c/d], [ax.YLim(1), ax.YLim(2)], 'k--');

pause(1)

%%

uistack(p_cd, 'top')
patch_slide(rect_bc, ...
    [0, 0, 0, 0], [d, d, d, d], t_pause=0.004)

grid_ydb = yline(b+d, 'k--');

pause(1)

%%

patch_slide(rect_bc, ...
    [0, 0, a, a], [0, 0, 0, 0], t_pause=0.004)

grid_below_bc = plot([ax.XLim(1), ax.XLim(2)], b/a*[ax.XLim(1)-c, ax.XLim(2)-c]+d, 'k--');

pause(1)

%%

patch_slide(rect_bc, ...
    [d/(d/c-b/a), 0, 0, d/(d/c-b/a)], ...
    [b/a*d/(d/c-b/a), 0, 0, b/a*d/(d/c-b/a)], t_pause=0.004)

pause(1)

%%

rect_ad.UserData.Visible = 'off';
rect_bc.UserData.Visible = 'off';

fadeinout([rect_ad, rect_bc, area], [0, 0, 1])

area.UserData.String = 'ad-bc';
area.UserData.Visible = 'on';