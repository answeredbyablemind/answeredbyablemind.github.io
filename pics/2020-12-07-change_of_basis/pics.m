clear; close all; clc;
addpath('D:\angeloyeo.github.io\MATLAB\다른사람참고code\Annotate-v1.2.1\Annotate\');
% addpath('C:\angeloyeo.github.io\MATLAB\다른사람참고code\Annotate-v1.2.1\Annotate\');

%% pic1

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
xlim([-5, 5])
ylim([-2, 5])

Annotate(gca,'arrow', [-5, 5], [0, 0]);
Annotate(gca,'arrow', [0, 0], [-2, 5]);

for i = -5:4
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

% 새로운 좌표계 상에 눈금 그리기
for i = -4:1
    if i~=0
        a = new_basis_inv * [i, 0.1]' * 2;
        b = new_basis_inv * [i, -0.1]' * 2;
        line([a(1), b(1)], [a(2), b(2)],'color','k')
        text(a(1)+0.1, a(2)+0.1, num2str(-i),'HorizontalAlignment','center');
    end
end

for i = -1:4
    if i~= 0
        
        a = new_basis_inv * [0.1, i]' * 2;
        b = new_basis_inv * [-0.1, i]' * 2;
        line([a(1), b(1)], [a(2), b(2)],'color','k')
        text(a(1)+0.1, a(2)+0.1, num2str(i),'HorizontalAlignment','center');
        
%         line([-0.1, 0.1], [i ,i], 'color','k')
%         text(-0.3, i, num2str(i),'HorizontalAlignment','center');
    end
end
Annotate(gca,'arrow', [x_cha_stt(1), x_cha_end(1)], [x_cha_stt(2), x_cha_end(2)]);
Annotate(gca,'arrow', [y_cha_stt(1), y_cha_end(1)], [y_cha_stt(2), y_cha_end(2)]);

h_vec = Annotate(gca,'arrow', [0, 2], [0, 2]);
h_vec.Primitive.LineWidth = 2;
h_vec.Primitive.Color = [1, 0, 0];

% xlabel on original axis
text(4.6429, 0.54082, '$$x$$','interpreter','latex','fontsize',12);
text(0.24194, 5.051, '$$y$$','interpreter','latex','fontsize',12);
text(3.8364, 5.0918,'$$x_{new}$$','interpreter','latex','fontsize',12);
text(-4.4816, 5.0714, '$$y_{new}$$','interpreter','latex','fontsize',12);
