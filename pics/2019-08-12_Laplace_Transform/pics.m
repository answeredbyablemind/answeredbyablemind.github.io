clear; close all; clc;
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