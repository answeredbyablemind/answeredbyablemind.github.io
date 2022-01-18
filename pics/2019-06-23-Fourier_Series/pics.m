clear; close all; clc;

n = -9:10;
c = zeros(1, length(n));

c(n==1) = 1;
c(n==2) = 3;

figure('position', [680, 802, 778, 230]);
stem(n, c ,'color','k','linewidth',2)
ylim([-0.5, 3.5])
grid on;
xlabel('$$i$$','interpreter','latex');
ylabel('$$c_i$$','interpreter','latex');
set(gca,'fontsize',12)
title('°è¼ö c_i¸¦ ÀÌ¿ëÇÑ ½ºÆåÆ®·³ Ç¥Çö');
text(0.2, c(n==1), '$$c_1$$','Interpreter','latex','fontsize',15)
text(1.2, c(n==2), '$$c_2$$','Interpreter','latex','fontsize',15)

%%
tau = 0.5;

T = 3;
A = 2;
figure;
for i = -1:2
    plot([-tau, -tau]+T*i, [0, A],'b');
    hold on;
    plot([-tau, tau]+T*i, [A, A],'b');
    plot([tau, tau]+T*i, [A, 0],'b');
end
ylim([-0.5, 3])

h = Annotate(gca,'arrow', [-4, 8], [0, 0]);
h.Primitive.Color = 'k';
h = Annotate(gca,'arrow', [0, 0], [-0.5, 3]);
h.Primitive.Color = 'k';
text(tau, -0.1, '\tau','fontsize',15,'HorizontalAlignment','center');
text(-tau, -0.1, '-\tau','fontsize',15,'HorizontalAlignment','center');
text(T, -0.15, '$$T$$','fontsize',15,'interpreter','latex','HorizontalAlignment','center');
text(2 * T, -0.15, '$$2T$$','fontsize',15,'interpreter','latex','HorizontalAlignment','center');
text(- T, -0.15, '$$-T$$','fontsize',15,'interpreter','latex','HorizontalAlignment','center');
set(gca,'visible','off')
text(7.9032, -0.15, '$$t$$','fontsize',15,'interpreter','latex','HorizontalAlignment','center');
text(0.8, 2.9, '$$x(t)$$','fontsize',15,'interpreter','latex','HorizontalAlignment','center');
text(6.8, 1, '...','fontsize',15)
text(-4.2, 1, '...','fontsize',15)
text(0.20, 2.15, 'A','fontsize',15,'interpreter','latex','HorizontalAlignment','center');

%%
close all;

x = 0;
t = linspace(-4, 8, 1000);
total_k = 100;
figure;
gca;
hold on;
set(gca,'visible','off')
xlim([-4, 8])
ylim([-0.5, 3])

h = Annotate(gca,'arrow', [-4, 8], [0, 0]);
h.Primitive.Color = 'k';
h = Annotate(gca,'arrow', [0, 0], [-0.5, 3]);
h.Primitive.Color = 'k';

text(tau, -0.1, '\tau','fontsize',15,'HorizontalAlignment','center');
text(-tau, -0.1, '-\tau','fontsize',15,'HorizontalAlignment','center');
text(T, -0.15, '$$T$$','fontsize',15,'interpreter','latex','HorizontalAlignment','center');
text(2 * T, -0.15, '$$2T$$','fontsize',15,'interpreter','latex','HorizontalAlignment','center');
text(- T, -0.15, '$$-T$$','fontsize',15,'interpreter','latex','HorizontalAlignment','center');

text(7.9032, -0.15, '$$t$$','fontsize',15,'interpreter','latex','HorizontalAlignment','center');
text(0.8, 2.9, '$$x(t)$$','fontsize',15,'interpreter','latex','HorizontalAlignment','center');
text(6.8, 1, '...','fontsize',15)
text(-4.2, 1, '...','fontsize',15)
text(0.20, 2.15, 'A','fontsize',15,'interpreter','latex','HorizontalAlignment','center');

newVid = VideoWriter('Problem_1','MPEG-4');

newVid.FrameRate = 60;
newVid.Quality = 100;
open(newVid);

for k=0:total_k
    c_k1 = 2*A*tau/T * sinc(2* k * tau / T);
    c_k2 = 2*A*tau/T * sinc(- 2* k * tau / T);
    
    if k == 0
        x = x + c_k1 * exp(1j * 2 * pi * k * t / T);
    else
        x = x + c_k1 * exp(1j * 2 * pi * k * t / T) + c_k2 * exp(-1j * 2*pi*k*t/T);
    end
    
    h = plot(t, x,'color',lines(1));
    writeVideo(newVid, getframe(gcf));
    
    if k < 10
        for i = 1:29
            writeVideo(newVid, getframe(gcf));
        end
    end
    
    
    drawnow;
    if k < total_k
        delete(h);
    end
end
close(newVid);

%%

k = -20:20;
c_k = 2*A*tau/T*sinc(2*k*tau/T);

t = linspace(k(1), k(end), 100);
c_t = 2*A*tau/T*sinc(2*t*tau/T);

figure('position',[680, 558, 1014, 420]); 
stem(k, c_k,'k','linewidth',2)
hold on;
plot(t, c_t,'--')
grid on;
xlabel('k');
ylabel('c_k');
title('ÆÞ½º ÇÔ¼öÀÇ Çª¸®¿¡ °è¼ö(½ºÆåÆ®·³)');
set(gca,'fontname','³ª´®°íµñ');