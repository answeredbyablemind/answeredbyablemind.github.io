clear; close all; clc;


%%
fs = 1000;
t = -1:1/fs:3;
figure;
plot(t, exp(1*t).*cos(2*pi*3*t).*unit_step(t, 0),'linewidth',2)
% grid on;
% xlabel('time (s)');
% ylabel('$$x(t)$$','interpreter','latex');
% set(gca,'fontsize',12)
% title('$$x(t) = e^t \cos(2\pi(3)t) u(t)$$','interpreter','latex','fontsize',15)
set(gca,'visible','off')
YLIMs = ylim;

figure('position',[1575, 757, 560, 222]);
plot(t, exp(-1*t),'linewidth',2);
set(gca,'visible','off')
ylim([0, 1])


figure('position', [1000, 558, 560, 57]);
plot(t, exp(-1*t).*cos(2*pi*3*t).*unit_step(t, 0),'linewidth',2)
% grid on;
% xlabel('time (s)');
% ylabel('$$x(t)$$','interpreter','latex');
% set(gca,'fontsize',12)
% title('$$x(t) = e^t \cos(2\pi(3)t) u(t)$$','interpreter','latex','fontsize',15)
set(gca,'visible','off')
YLIMs = ylim;

%%

Lx = @(s, a, b) (s-a)./((s-a).^2+b^2); % e^(at)cos(bt)의 라플라스 변환

[x, y] = meshgrid(-10:0.1:10);

figure;
shading interp
z = abs(Lx(x+1j*y, 2, 3)); % e^(2t)cos(3t)
% 
% for i = 1:size(z,1)
%     for j = 1:size(z,2)
%         z(i,j) = min(z(i,j), 0.5);
%     end
% end

m1 = surf(x, y, z);
caxis([0, 0.5])
colormap(jet)
cmap = colormap;
shading interp
set(m1, 'EdgeColor','none')
xlabel('$$\sigma$$','interpreter','latex','fontsize',15);
ylabel('$$j\omega$$','interpreter','latex','fontsize',15);
zlabel('$$|X(s)|$$','interpreter','latex','fontsize',15);
view(-323, 34)
% zlim([0, 0.5])

sigma = x(1,:);

%%
% close all
my_sig = 4;
idx = find(sigma == my_sig);
clear colorVector
for i_x = 1:size(x, 1)
    if m1.ZData(i_x, idx) > 0.5
        my_color = cmap(end,:);
    elseif m1.ZData(i_x, idx) == 0
        my_color = cmap(1,:);
    else
        my_color = cmap(ceil(m1.ZData(i_x, idx)/0.5 * 256),:);
    end
    colorVector(i_x,:) = my_color;
end

figure;
for i = 1:size(colorVector, 1)-1
    plot(m1.YData(i:i+1, idx), m1.ZData(i:i+1, idx), 'color', colorVector(i,:),'linewidth',3);
    hold on;
end
ylim([0, 1])
xlabel('$$j\omega$$','interpreter','latex','fontsize',15)
ylabel(['$$|X(s)|$$'],'interpreter','latex','fontsize',15)
title(['$$|X(s)|, \sigma = ',num2str(my_sig),'$$'],'interpreter','latex','fontsize',15)
grid on;
set(gca,'fontsize',15)
% 
% figure;
% for i = 1:size(colorVector, 1)-1
%     plot(my_sig*ones(1,2), y(i:i+1, 1)', 'color', colorVector(i,:),'linewidth',2);
%     hold on;
% end
% set(gca,'visible','off')

%%
close all;

fs = 1000;
t = 0:1/fs:3;
f =(-6*pi):2*pi:(6*pi);
for i_f = 1:length(f)
    x = exp(1j*f(i_f)*t);
    figure('position',[1000, 558, 315, 190])
    plot3(t, real(x), imag(x),'color','k','linewidth',3);
    set(gca,'visible','off')
    view(22.8, 30.6)
end

%%
close all;
fs = 1000;
t = 0:1/fs:3;

x = exp(1*t).*exp(1j*(6*pi)*t);
figure('position',[1000, 558, 315, 190])
plot3(t, real(x), imag(x),'color','k','linewidth',3);
set(gca,'visible','off')
view(22.8, 30.6)


x = exp((-1)*t).*exp(1j*(6*pi)*t);
figure('position',[1000, 558, 315, 190])
plot3(t, real(x), imag(x),'color','k','linewidth',3);
set(gca,'visible','off')
view(22.8, 30.6)


x = exp((-1.5)*t).*exp(1j*(4*pi)*t);
figure('position',[1000, 558, 315, 190])
plot3(t, real(x), imag(x),'color','k','linewidth',3);
set(gca,'visible','off')
view(22.8, 30.6)

x = exp((1.5)*t).*exp(1j*(4*pi)*t);
figure('position',[1000, 558, 315, 190])
plot3(t, real(x), imag(x),'color','k','linewidth',3);
set(gca,'visible','off')
view(22.8, 30.6)

x = exp((2)*t).*exp(1j*(7*pi)*t);
figure('position',[1000, 558, 315, 190])
plot3(t, real(x), imag(x),'color','k','linewidth',3);
set(gca,'visible','off')
view(22.8, 30.6)



x = exp((-1)*t).*exp(1j*(-3*pi)*t);
figure('position',[1000, 558, 315, 190])
plot3(t, real(x), imag(x),'color','k','linewidth',3);
set(gca,'visible','off')
view(22.8, 30.6)

x = exp((-2)*t).*exp(1j*(-4*pi)*t);
figure('position',[1000, 558, 315, 190])
plot3(t, real(x), imag(x),'color','k','linewidth',3);
set(gca,'visible','off')
view(22.8, 30.6)


%%

fs = 1000;
t = -5:1/fs:5;

f1 = 1.6;
f2 = 0.5;
sigma = 1.1;

figure;
subplot(2,1,1);
plot(t, cos(2*pi*f1*t-0.1),'color',[50, 168, 82]/255,'linewidth',2)
hold on;7
plot(t, 1.5 * cos(2*pi*f2*t),'color','r','linewidth',2)
ylim([-2, 2])
xlabel('t');
ylabel('Fourier basis');

subplot(2,1,2);
plot(t, exp(sigma*t/20) .* cos(2*pi*f1*t-0.1),'color',[50, 168, 82]/255,'linewidth',2)
ylim([-2, 2])
hold on;
plot(t, exp(sigma*t/10) .* cos(2*pi*f2*t),'color','r','linewidth',2)
ylim([-2, 2])
xlabel('t');
ylabel('Laplace basis');

%%

plotXY(-2.5, 2.5, -2.5, 2.5)