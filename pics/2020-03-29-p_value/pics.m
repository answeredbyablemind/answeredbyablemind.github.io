clear; close all; clc;


%% 샘플 수는 fixed시킨 채로 effect size를 늘렸을 때 t-value와 p-value의 변화
rng(4);

effect_sizes = [0.1, 0.2, 1, 5];

figure('position',[680, 396, 810, 582]);
for i = 1:length(effect_sizes)
    n = 50;
    effect_size = effect_sizes(i);
    
    gr1 = randn(n,1);
    gr2 = randn(n,1)+effect_size;
    
    pd1 = fitdist(gr1, 'Normal');
    pd2 = fitdist(gr2, 'Normal');
    
    xx = linspace(-5, 10, 100);
    yy1 = pdf(pd1, xx);
    yy2 = pdf(pd2, xx);
    
    subplot(2,2,i);
    plot(xx, yy1,'linewidth',2);
    hold on;
    plot(xx,yy2,'linewidth',2);
    
    YLIMs = ylim;
    
    if YLIMs(2)*0.75 <= max([yy1, yy2])
        ylim([YLIMs(1), YLIMs(2) * 1.3]);
    end
    
    
    [~,p,ci,stats] = ttest2(gr1, gr2);
    
    t = stats.tstat;
    p;
    
    title(['n = ',num2str(n),' (fixed), effect size = ',num2str(effect_size)]);
    
    if p < 0.01
        text(0.03, 0.87, sprintf('t-value: %.2f \np-value: %.2e',t, p),'Units','normalized','fontsize',12)
    else
        text(0.03, 0.87, sprintf('t-value: %.2f \np-value: %.2f',t, p),'Units','normalized','fontsize',12)
    end
    grid on;
    xlabel('x');
    ylabel('frequency');
    
    
end
%% effect size는 fixed시킨 채로 샘플 수를 늘렸을 때 t-value와 p-value의 변화
rng(4);

ns = [50, 100, 1000, 5000];
effect_size = -0.1;

figure('position',[680, 396, 810, 582]);
for i = 1:length(ns)
    n = ns(i);
    
    gr1 = randn(n,1);
    gr2 = randn(n,1)+effect_size;
    
    subplot(2,2,i);
    h1 = histogram(gr1);
    hold on;
    h2 = histogram(gr2,'BinWidth',h1.BinWidth);
    
    YLIMs = ylim;
    
    if YLIMs(2)*0.75 <= max([h1.Values, h2.Values])
        ylim([YLIMs(1), YLIMs(2) * 1.3]);
    end
    
    
    [~,p,ci,stats] = ttest2(gr1, gr2);
    
    t = stats.tstat;
    p;
    
    title(['n = ',num2str(n),' / effect size = -0.1 (fixed)']);
    
    if p < 0.01
        text(0.03, 0.87, sprintf('t-value: %.2f \np-value: %.2e',t, p),'Units','normalized','fontsize',12)
    else
        text(0.03, 0.87, sprintf('t-value: %.2f \np-value: %.2f',t, p),'Units','normalized','fontsize',12)
    end
    grid on;
    xlabel('x');
    ylabel('frequency');
    
    
end