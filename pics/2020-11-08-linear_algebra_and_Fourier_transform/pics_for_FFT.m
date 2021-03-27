clear; close all; clc;

Fs = 1000;
T = 1/Fs;
L = 1500;
t = 0:1/Fs:(L-1)/Fs;

S = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t);
figure;
subplot(2,1,1);
plot(t, S)
xlabel('time (s)');
ylabel('signal s(t)')
grid on;
title('전체 시간의 신호 파형');

subplot(2,1,2);
plot(t, S)
xlabel('time (s)');
ylabel('signal s(t)')
grid on;
xlim([0, 0.3])
title('신호의 일부 구간을 확대한 그림');
%% FFT 
Y = fft(S);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;

figure;
stem(f,P1,'linewidth',2) 
title('Single-Sided Amplitude Spectrum of S(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
grid on;
ylim([0, 1.2])
% xlim([0, 150])