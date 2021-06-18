clear; close all; clc;
%%
addpath(genpath('D:\angeloyeo.github.io\pics\2021-06-18-Schrodinger_equation\'))

%%
n = 500; % length of the wave for both space and time
% wave = zeros(n, n); % wave is a function of space and time

% 생각해보면 wave의 equation은
% e^(i(kx-wt))이고, 이것은 e^{ikx} .* e^{-iwt}로 곱해진것으로 생각해볼 수 있겠네.

x = linspace(0, pi, n);
t = linspace(0, 1, n);

% wave_x = (exp(1i * pi * x) + 1/3*exp(1i * 2 * pi * x) + 1/5 * exp(1i*4*pi*x) + 1/7 * exp(1i*7*pi*x)).*sin(x);
% wave_t = exp(-1i * pi * t);
%
wave_x = zeros(1, n) + 1i*zeros(1,n);
rng(1);
for i_wave = 1:2
    wave_x = wave_x + 1 / randi(10) * exp(1i* randi(10) * pi * x);
end
wave_x = wave_x .* sin(x);

wave_t = zeros(1, n) + 1i*zeros(1,n);
for i_wave = 1
    wave_t = wave_t + 1 / randi(10) * exp(1i* randi(10) * pi * t);
end

wave = wave_x' * wave_t/10;

figure;
xlim([min(x), max(x)+1])
ylim([min(real(wave(:))), max(real(wave(:)))])
zlim([min(imag(wave(:))), max(imag(wave(:)))])
hold on;
XLIMs = xlim;
YLIMs = ylim;
ZLIMs = zlim;

line([0, 0], YLIMs, [0, 0],'color','k')
line(XLIMs, [0, 0], [0, 0],'color','k')
line([0, 0], [0, 0], ZLIMs,'color','k')

text(0, YLIMs(2), ZLIMs(2)*0.1, 'Real')
text(0, YLIMs(2)*0.1, ZLIMs(2)*0.9,'Imag')
text(XLIMs(2), YLIMs(2)*0.1, 0,'space x')

set(gca,'visible','off')

view(46.9, 31.6);
for i_t = 1:length(t)
    h = plot3(x, real(wave(:,i_t)), imag(wave(:,i_t)),'linewidth',2,'color',lines(1));
    
    drawnow;
    
    if i_t < length(t)
        delete(h)
    end
end

%% Energy operator 계산 용 단순 웨이브
n = 500; % length of the wave for both space and time

x = linspace(0, pi, n);
t = linspace(0, 1, n);
wave_x = sin(3 * x);
wave_t = exp(-1i * pi * t);

wave = wave_x' * wave_t;

figure;
xlim([min(x), max(x)+1])
ylim([min(real(wave(:))), max(real(wave(:)))])
zlim([min(imag(wave(:))), max(imag(wave(:)))])
hold on;
XLIMs = xlim;
YLIMs = ylim;
ZLIMs = zlim;

line([0, 0], YLIMs, [0, 0],'color','k')
line(XLIMs, [0, 0], [0, 0],'color','k')
line([0, 0], [0, 0], ZLIMs,'color','k')

text(0, YLIMs(2), ZLIMs(2)*0.1, 'Real')
text(0, YLIMs(2)*0.1, ZLIMs(2)*0.9,'Imag')
text(XLIMs(2), YLIMs(2)*0.1, 0,'space x')

set(gca,'visible','off')

view(46.9, 31.6);
for i_t = 1:length(t)
    h = plot3(x, real(wave(:,i_t)), imag(wave(:,i_t)),'linewidth',2,'color',lines(1));
    drawnow;
    
    if i_t < length(t)
        delete(h)
    end
end

%% Energy operator의 의미 확인

% 250번째 시간 포인트와 270번째 시간 포인트에 대한 변화 확인

figure;
xlim([min(x), max(x)+1])
ylim([min(real(wave(:))), max(real(wave(:)))])
zlim([min(imag(wave(:))), max(imag(wave(:)))])
hold on;
XLIMs = xlim;
YLIMs = ylim;
ZLIMs = zlim;

line([0, 0], YLIMs, [0, 0],'color','k')
line(XLIMs, [0, 0], [0, 0],'color','k')
line([0, 0], [0, 0], ZLIMs,'color','k')

text(0, YLIMs(2), ZLIMs(2)*0.1, 'Real')
text(0, YLIMs(2)*0.1, ZLIMs(2)*0.9,'Imag')
text(XLIMs(2), YLIMs(2)*0.1, 0,'space x')

set(gca,'visible','off')
view(46.9, 31.6);

my_color = lines(2);
plot3(x, real(wave(:,250)), imag(wave(:,250)),'linewidth',2,'color',my_color(1,:));
plot3(x, real(wave(:,270)), imag(wave(:,270)),'linewidth',2,'color',my_color(2,:));

%% momentum operator
