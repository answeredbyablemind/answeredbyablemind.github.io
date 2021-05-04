clear; close all; clc;

%% logistic growth

N = 1000;
C = 9;
k = 0.3;
t = linspace(0, 40, 100);

P = N./(C*exp(-k*t)+1);

figure;
plot(t, P,'linewidth',2)
ylim([0, 1200])
grid on;

xlabel('time');
ylabel('ÀÎ±¸ ¼ö');
title('$$P(t)=1000/({9e^{-0.3*t}+1})$$','interpreter','latex')
set(gca,'fontname','³ª´®°íµñ')
set(gca,'fontsize',10)

%%

xx = linspace(0, 1, 10);
figure;
plot(xx, 0.1*xx,'k','linewidth',2);
xlabel('º¯ÇüµÈ ±æÀÌ, x (m)');
ylabel('Åº¼º·Â, F (N)')
grid on;
title('Åº¼º·Â°ú º¯ÇüµÈ ¿ë¼öÃ¶ ±æÀÌÀÇ °ü°è')
set(gca,'fontname','³ª´®°íµñ')

%% sine °î¼±

xx = linspace(0, 30, 1000);
figure('position',[381, 556, 667, 206]);
plot(xx, sin(xx))

xlabel('time (s)');
ylabel('x(t)')
ylim([-1.5 1.5])
grid on;
title('A undamped spring-mass system');
set(gca,'fontname','³ª´®°íµñ')

%% over damped °î¼±

xx = linspace(0, 10, 1000);
yy = exp(-xx) - exp(-2*xx);

figure('position',[381, 556, 667, 206]);
plot(xx, yy,'linewidth', 2)
xlabel('time (s)');
ylabel('x(t)')
grid on;
title('An over-damped spring-mass system');
set(gca,'fontname','³ª´®°íµñ')
ylim([-0.05, 0.3])

%% under damped °î¼±

xx = linspace(0, 10, 1000);
yy = 1/6 .* exp(-3*xx/2) .* sin(6*xx);

figure('position',[381, 556, 667, 206]);
plot(xx, yy,'linewidth', 2)
xlabel('time (s)');
ylabel('x(t)')
grid on;
title('An under-damped spring-mass system');
set(gca,'fontname','³ª´®°íµñ')
ylim([-0.1, 0.15])