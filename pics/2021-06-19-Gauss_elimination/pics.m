clear; close all; clc;

addpath('D:\angeloyeo.github.io\MATLAB\다른사람참고code\Annotate-v1.2.1\Annotate\');
% addpath('C:\angeloyeo.github.io\MATLAB\다른사람참고code\Annotate-v1.2.1\Annotate\');

%% over-determined system

% x 축 원래 axis

new_basis = [1, -1;1, 1];
new_basis_inv = inv(new_basis);

x_cha_stt = new_basis * [-1.5; 0];
x_cha_end = new_basis * [5; 0];
y_cha_stt = new_basis * [0; -1.5];
y_cha_end = new_basis * [0; 5];

vec_ori = [2; 2];
vec_changed = new_basis_inv * vec_ori;

figure('color','w');
hold on;
set(gca,'Visible','off')
xlim([-2.5, 2.5])
ylim([-2, 5])

Annotate(gca,'arrow', [-2.5, 2.5], [0, 0]);
Annotate(gca,'arrow', [0, 0], [-2, 5]);

for i = -2:2
    if i~=0
        line([i ,i], [-0.1, 0.1],'color','k')
        text(i, -0.3, num2str(i),'HorizontalAlignment','center');
    end
end

for i = -2:4
    if i~= 0
        line([-0.1, 0.1], [i ,i], 'color','k')
        text(-0.3, i, num2str(i),'HorizontalAlignment','center');
    end
end

text(2.3, -0.4, '$$x$$','interpreter','latex','fontsize',15)
text(0.1, 4.7, '$$y$$','interpreter','latex','fontsize',15)
text(-0.2, -0.3,'$$0$$','interpreter','latex','fontsize',15)
xx = linspace(-2.5, 2.5, 100);
yy1 = -2*xx-1;
yy2 = 3 *xx-2;
yy3 = xx+1;

plot(xx, yy1,'linewidth',2);
hold on;
plot(xx, yy2,'linewidth',2);
plot(xx, yy3,'linewidth',2);