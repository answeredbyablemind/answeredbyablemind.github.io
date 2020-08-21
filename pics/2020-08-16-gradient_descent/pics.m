clear; close all; clc;

%%
xx = linspace(-3,3,100);
yy = xx.^2;
yy_prime = 2*xx;
n_iter = 100;

step_sizes = [0.001, 0.018, 1.02];
titles = {'너무 작은 step size', '적절한 step size', '너무 큰 step size'};
figure('position',[250, 442, 1080, 320]);
my_color = jet(n_iter);

for i_subplot = 1:3
    xx2see_old = -1.5;
    subplot(1,3,i_subplot);
    plot(xx, yy)
    ylim([-1, 5])
    hold on;
    for i = 1:n_iter
        xx2see_new = xx2see_old - step_sizes(i_subplot) * 2*(xx2see_old);
        plot([xx2see_old, xx2see_new], [xx2see_old^2, xx2see_new^2],'-o',...
            'color',my_color(i,:), 'markerfacecolor',my_color(i,:),'markeredgecolor','none');
        xx2see_old = xx2see_new;
    end
    
    title(titles{i_subplot})
    grid on;
    xlabel('x');
    ylabel('y');
end

figure;
colormap(jet);
cbar = colorbar;
set(cbar, 'Ticks', [])
set(gca,'visible','off')

%% local minima 관련 
xx= linspace(-1, 5, 100);
yy = 1/5 * (xx+0.1).*(xx-1.1).*(xx-1.8) .* (xx-2.1).*(xx-3.2).*(8*xx-4.8)+2;

figure; plot(xx, yy,'linewidth',2)
ylim([-5, 8])
xlabel('x');
ylabel('y');
grid on;