clear; close all; clc;

n = -2:5;
x = [0, 0, 1, 3, 2, 1, 0, 0];
z = [0, -1, 2, -1, -3, -2, 0, 0];

%%
figure('position',[680, 306, 560, 672*2/3]);
subplot(2,1,1);
stem(n, x,'color',lines(1),'linewidth',2);
xlabel('n');
ylabel('x[n]');
title('x[n]');
ylim([0, 6])
grid on;

subplot(2,1,2);
clear h
h(1) = stem(n, 1.5*x,'color',[0.85, 0.325, 0.098],'linewidth',2);
hold on;
h(2) = stem(n+0.1, x,'color',lines(1),'linewidth',2);
xlabel('n');
ylabel('1.5 x[n]');
title('1.5 x[n]');
ylim([0, 6])
grid on;
legend(h, {'1.5 x[n]','x[n]'})

%%
figure('position',[680, 306, 560, 672]);
subplot(3,1,1);
stem(n, x,'color',lines(1),'linewidth',2);
xlabel('n');
ylabel('x[n]');
title('x[n]');
ylim([-4, 4])
grid on;

subplot(3,1,2);
stem(n, z,'color',[0.85, 0.325, 0.098],'linewidth',2);
xlabel('n');
ylabel('z[n]');
title('z[n]');
ylim([-4, 4])
grid on;

subplot(3,1,3);
h(1) = stem(n, x+ z,'k','linewidth',2);
hold on;
h(2) = stem(n-0.1, x,'color',lines(1),'linewidth',2);
h(3) = stem(n+0.1, z,'color',[0.85, 0.325, 0.098],'linewidth',2);
xlabel('n');
ylabel('x[n]+z[n]')
title('x[n]+z[n]')
ylim([-4, 4])
grid on;
lgd = legend(h, {'x[n]+z[n]', 'x[n]','z[n]'},'location',[0.7166, 0.2520, 0.1732, 0.0789]);

%%

addpath('..\..\MATLAB\다른사람참고code\Annotate-v1.2.1\Annotate\');

vec_ori = [3; 4];

figure('color','w');
hold on;
set(gca,'Visible','off')
xlim([-2, 9])
ylim([-2, 9])

Annotate(gca,'arrow', [-1.5, 8], [0, 0]);
Annotate(gca,'arrow', [0, 0], [-1.5, 8]);

for i = -1:7
    if i~=0
        line([i ,i], [-0.1, 0.1],'color','k')
        text(i, -0.3, num2str(i),'HorizontalAlignment','center');
    end
end

for i = -1:7
    if i~= 0
        line([-0.1, 0.1], [i ,i], 'color','k')
        text(-0.3, i, num2str(i),'HorizontalAlignment','center');
    end
end

text(3.0818, 4.3959, '$$\vec{v} = 3\hat{i} + 4\hat{j}$$','interpreter','latex','fontsize',15)

% xlabel on original axis
text(7.9228, -0.51633, '$$x$$','interpreter','latex','fontsize',12);
text(-0.24401, 8.3105, '$$y$$','interpreter','latex','fontsize',12);

for i = 1
    h_vec = Annotate(gca,'arrow',[0, i], [0, 0]);
    h_vec.Primitive.LineWidth = 2;
    h_vec.Primitive.Color = lines(1);
end
text(0.5, -0.7, '$$\hat{i}$$','interpreter','latex','fontsize',20,'HorizontalAlignment','center','color',lines(1));

for i = 1
    h_vec = Annotate(gca,'arrow',[0, 0], [0, i]);
    h_vec.Primitive.LineWidth = 2;
    h_vec.Primitive.Color = [0.85, 0.325, 0.098];
end
text(-0.5, 0.5, '$$\hat{j}$$','interpreter','latex','fontsize',20,'HorizontalAlignment','center','color',[0.85, 0.325, 0.098]);

h_vec = Annotate(gca,'arrow', [0, 3], [0, 4]);
h_vec.Primitive.LineWidth = 3;
h_vec.Primitive.Color = [1, 0, 0];

%%

addpath('..\..\MATLAB\다른사람참고code\Annotate-v1.2.1\Annotate\');

vec_ori = [3; 4];

figure('color','w');
hold on;
set(gca,'Visible','off')
xlim([-2, 9])
ylim([-2, 9])

Annotate(gca,'arrow', [-1.5, 8], [0, 0]);
Annotate(gca,'arrow', [0, 0], [-1.5, 8]);

for i = -1:7
    if i~=0
        line([i ,i], [-0.1, 0.1],'color','k')
        text(i, -0.3, num2str(i),'HorizontalAlignment','center');
    end
end

for i = -1:7
    if i~= 0
        line([-0.1, 0.1], [i ,i], 'color','k')
        text(-0.3, i, num2str(i),'HorizontalAlignment','center');
    end
end

text(3.0818, 4.3959, '$$\vec{v} = 3\hat{i} + 4\hat{j}$$','interpreter','latex','fontsize',15)

% xlabel on original axis
text(7.9228, -0.51633, '$$x$$','interpreter','latex','fontsize',12);
text(-0.24401, 8.3105, '$$y$$','interpreter','latex','fontsize',12);

for i = 1:3
    h_vec = Annotate(gca,'arrow',[0, i], [0, 0]);
    h_vec.Primitive.LineWidth = 2;
    h_vec.Primitive.Color = lines(1);
end

for i = 1:4
    h_vec = Annotate(gca,'arrow',[3, 3], [i-1, i]);
    h_vec.Primitive.LineWidth = 2;
    h_vec.Primitive.Color = [0.85, 0.325, 0.098];
end


h_vec = Annotate(gca,'arrow', [0, 3], [0, 4]);
h_vec.Primitive.LineWidth = 3;
h_vec.Primitive.Color = [1, 0, 0];


%%

% x 축 원래 axis

theta = 10 / 180 * pi;
mtx_rot = [cos(theta), -sin(theta); sin(theta), cos(theta)];
mtx_rot_inv = inv(mtx_rot);

x_cha_stt = mtx_rot * [-1.5; 0];
x_cha_end = mtx_rot * [8; 0];
y_cha_stt = mtx_rot * [0; -1.5];
y_cha_end = mtx_rot * [0; 8];

vec_ori = [3; 4];
vec_changed = mtx_rot_inv * vec_ori;

figure('color','w');
hold on;
set(gca,'Visible','off')
xlim([-2, 9])
ylim([-2, 9])

Annotate(gca,'arrow', [-1.5, 8], [0, 0]);
Annotate(gca,'arrow', [0, 0], [-1.5, 8]);

for i = -1:7
    if i~=0
        line([i ,i], [-0.1, 0.1],'color','k')
        text(i, -0.3, num2str(i),'HorizontalAlignment','center');
    end
end

for i = -1:7
    if i~= 0
        line([-0.1, 0.1], [i ,i], 'color','k')
        text(-0.3, i, num2str(i),'HorizontalAlignment','center');
    end
end

Annotate(gca,'arrow', [x_cha_stt(1), x_cha_end(1)], [x_cha_stt(2), x_cha_end(2)]);
Annotate(gca,'arrow', [y_cha_stt(1), y_cha_end(1)], [y_cha_stt(2), y_cha_end(2)]);

h_vec = Annotate(gca,'arrow', [0, 3], [0, 4]);
h_vec.Primitive.LineWidth = 2;
h_vec.Primitive.Color = [1, 0, 0];

% xlabel on original axis
text(7.9228, -0.51633, '$$x$$','interpreter','latex','fontsize',12);
text(-0.24401, 8.3105, '$$y$$','interpreter','latex','fontsize',12);
text(7.8173, 1.821,'$$x_{new}$$','interpreter','latex','fontsize',12);
text(-2.038, 8.4708, '$$y_{new}$$','interpreter','latex','fontsize',12);

% 새로운 좌표계에 정사영
linetip = [3; 4];
onto = mtx_rot * [vec_changed(1); 0];
line([linetip(1), onto(1)], [linetip(2), onto(2)],'color','k','linestyle','--')

onto = mtx_rot * [0; vec_changed(2)];
line([linetip(1), onto(1)], [linetip(2), onto(2)],'color','k','linestyle','--')

% 새로운 기저 벡터
new_i = mtx_rot * [1; 0];
new_j = mtx_rot * [0; 1];

h_vec = Annotate(gca,'arrow', [0, new_i(1)], [0, new_i(2)]);
h_vec.Primitive.LineWidth = 2;
h_vec.Primitive.Color = lines(1);

text(0.8, -0.7, '$$\hat{i}_{new}$$','interpreter','latex','fontsize',18,'HorizontalAlignment','center','color',lines(1));

h_vec = Annotate(gca,'arrow', [0, new_j(1)], [0, new_j(2)]);
h_vec.Primitive.LineWidth = 2;
h_vec.Primitive.Color = [0.85, 0.325, 0.098];

text(-0.7, 0.5, '$$\hat{j}_{new}$$','interpreter','latex','fontsize',18,'HorizontalAlignment','center','color',[0.85, 0.325, 0.098]);

%%

% x 축 원래 axis

theta = 10 / 180 * pi;
mtx_rot = [cos(theta), -sin(theta); sin(theta), cos(theta)];
mtx_rot_inv = inv(mtx_rot);

x_cha_stt = mtx_rot * [-1.5; 0];
x_cha_end = mtx_rot * [8; 0];
y_cha_stt = mtx_rot * [0; -1.5];
y_cha_end = mtx_rot * [0; 8];

vec_ori = [3; 4];
vec_changed = mtx_rot_inv * vec_ori;

figure('color','w');
hold on;
set(gca,'Visible','off')
xlim([-2, 9])
ylim([-2, 9])

Annotate(gca,'arrow', [-1.5, 8], [0, 0]);
Annotate(gca,'arrow', [0, 0], [-1.5, 8]);

for i = -1:7
    if i~=0
        line([i ,i], [-0.1, 0.1],'color','k')
        text(i, -0.3, num2str(i),'HorizontalAlignment','center');
    end
end

for i = -1:7
    if i~= 0
        line([-0.1, 0.1], [i ,i], 'color','k')
        text(-0.3, i, num2str(i),'HorizontalAlignment','center');
    end
end

Annotate(gca,'arrow', [x_cha_stt(1), x_cha_end(1)], [x_cha_stt(2), x_cha_end(2)]);
Annotate(gca,'arrow', [y_cha_stt(1), y_cha_end(1)], [y_cha_stt(2), y_cha_end(2)]);

h_vec = Annotate(gca,'arrow', [0, 3], [0, 4]);
h_vec.Primitive.LineWidth = 2;
h_vec.Primitive.Color = [1, 0, 0];

% xlabel on original axis
text(7.9228, -0.51633, '$$x$$','interpreter','latex','fontsize',12);
text(-0.24401, 8.3105, '$$y$$','interpreter','latex','fontsize',12);
text(7.8173, 1.821,'$$x_{new}$$','interpreter','latex','fontsize',12);
text(-2.038, 8.4708, '$$y_{new}$$','interpreter','latex','fontsize',12);

% 새로운 좌표계에 정사영
linetip = [3; 4];
onto = mtx_rot * [vec_changed(1); 0];
line([linetip(1), onto(1)], [linetip(2), onto(2)],'color','k','linestyle','--')

onto = mtx_rot * [0; vec_changed(2)];
line([linetip(1), onto(1)], [linetip(2), onto(2)],'color','k','linestyle','--')

% 새로운 기저 벡터
new_i = mtx_rot * [1; 0];
new_j = mtx_rot * [0; 1];

for i = 1:4
    h_vec = Annotate(gca,'arrow', [new_i(1) * (i-1), new_i(1) * i], [new_i(2) * (i-1), new_i(2) * i]);
    h_vec.Primitive.LineWidth = 2;
    h_vec.Primitive.Color = lines(1);
end

for i = 1:4
    h_vec = Annotate(gca,'arrow', [new_j(1) * (i-1), new_j(1) * i], [new_j(2) * (i-1), new_j(2) * i]);
    h_vec.Primitive.LineWidth = 2;
    h_vec.Primitive.Color = [0.85, 0.325, 0.098];
end

text(3.0818, 4.3959, '$$\vec{v} = 3\hat{i} + 4\hat{j}$$','interpreter','latex','fontsize',15)
text(3.6, 3.3959, ['$$= ',sprintf('%.1f',vec_changed(1)),'\hat{i}_{new} + ',sprintf('%.1f',vec_changed(2)),'\hat{j}_{new}$$'],'interpreter','latex','fontsize',15)
