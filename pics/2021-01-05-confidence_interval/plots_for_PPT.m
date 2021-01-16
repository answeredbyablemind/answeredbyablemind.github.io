clear; close all; clc;

%% t-분포와 정규분포의 비교

dof = 2;
xx = linspace(-3,3,100);
pdf_norm = pdf('normal',xx, 0, 1);
pdf_t = pdf('T', xx, dof);

figure;
h(1) = plot(xx, pdf_norm,'linewidth',2);
hold on;
h(2) = plot(xx, pdf_t,'linewidth',2);
[~, icons] = legend(h, '표준정규분포', ['t-분포 (자유도: ',num2str(dof),')']);
icons = findobj(icons,'Type','line'); % Type은 line이면서 Marker는 없지는 않는 것을 찾아야 함.
set(icons, 'linewidth', 5)
grid on;

xlabel('x');
ylabel('P(x)');

%% 자유도에 따른 t-분포와 정규분포 비교


xx = linspace(-3,3,100);
pdf_norm = pdf('normal',xx, 0, 1);

dofs = [1, 2, 5, 10];

for i_dof = 1:length(dofs)
    dof = dofs(i_dof);
    pdf_t(i_dof,:) = pdf('T', xx, dof);
end

clear h
figure;
h(1) = plot(xx, pdf_norm,'linewidth',2);
hold on;
for i = 1:length(dofs)
    h(i+1) = plot(xx, pdf_t(i,:),'linewidth',2);
end

[~, icons] = legend(h, ...
    '표준정규분포', 't-분포 (자유도: 1)', 't-분포 (자유도: 2)', 't-분포 (자유도: 5)', 't-분포 (자유도: 10)');

icons = findobj(icons,'Type','line'); % Type은 line이면서 Marker는 없지는 않는 것을 찾아야 함.
set(icons, 'linewidth', 5)
grid on;

xlabel('x');
ylabel('P(x)');

%%


% rng(4)
% data = round(randn(1,150)* 2 + 15);
load('data.mat')

%%
close all;
k_data = unique(data);
my_order = [];

for i_data = 1:length(k_data)
    idx = data == k_data(i_data);
    for i_idx = 1:sum(idx)
        my_order = [my_order, i_idx];
    end
end

mksize = 8;
fsize= 12;

k_data = unique(data);

for i_data = 1:length(k_data)
    idx = data == k_data(i_data);
    
    for i_idx = 1:sum(idx)
        plot(k_data(i_data), i_idx,'o','markersize',mksize,'markerfacecolor',ones(1,3) * 0.5, 'markeredgecolor','none');
        hold on;
    end
end

rng(3)
samples2choose = randperm(150,20);

data_sort = sort(data);

plot(data_sort(samples2choose), my_order(samples2choose),'o','markersize',mksize,'markerfacecolor','r',...
    'markeredgecolor','none');

xlim([8 22])
ylim([0, 40])
grid on;
xlabel('height(cm)');
ylabel('count');
title('150명 중 20명 sample 추출');
text(9.5, 22, ['SAMPLE n = ',num2str(length(samples2choose))],'fontsize',fsize)
set(gca,'fontsize',fsize);

%% 표본 추출
close all;
mksize = 8;
fsize= 12;

figure('position',[680, 738, 350, 240])
data2plot = data_sort(samples2choose);
k_data = unique(data2plot);
for i_data = 1:length(k_data)
    idx = data2plot == k_data(i_data);
    
    for i_idx = 1:sum(idx)
        plot(k_data(i_data), i_idx,'o','markersize',mksize,'markerfacecolor','r', 'markeredgecolor','none');
        hold on;
    end
end
ylim([0.5, 9]);
xlim([8, 22]);
xlabel('height(cm)');
ylabel('count');
grid on;

% 평균값 그려주기
plot(mean(data2plot),8,'o','MarkerFaceColor','r', 'markersize', mksize/1.5,'MarkerEdgeColor','none');

% std 그려주기
plot([mean(data2plot) - 2 * std(data2plot)/sqrt(6), mean(data2plot) + 2 * std(data2plot)/sqrt(6)], [8, 8], 'color', 'r','linewidth',2);
%     set(gca,'fontsize',fsize);
% title([num2str(i_smpl),'번째 표본 그룹']);


%% Fig. 100번 샘플링 했을 때 모평균이 몇 번 들어오는지
rng(3)
n_sample = 20;
n_iter = 100;
SEM = zeros(1, n_iter);
mns = zeros(1, n_iter);
for i_smpl = 1:n_iter
    n_randperm = randperm(150);
    
    data_sampled = data(n_randperm(1:n_sample));
    
    mns(i_smpl) = mean(data_sampled);
    SEM(i_smpl) = std(data_sampled)/sqrt(n_sample);
end

figure('position',[680, 550, 1200, 420]);
hold on;
count = 0;
for i = 1:n_iter
    
    line([i i], [mns(i) - 2* SEM(i), mns(i) + 2 * SEM(i)], 'color','k','linewidth',2)
    plot(i, mns(i), 'o', 'markerfacecolor',[0.8, 0.8, 0.8],'markeredgecolor','k');
    if ((mns(i) - 2*SEM(i)) > mean(data)) || ((mns(i) + 2*SEM(i)) < mean(data))
        
        line([i i], [mns(i) - 2* SEM(i), mns(i) + 2 * SEM(i)], 'color','r','linewidth',2)
        plot(i, mns(i), 'o', 'markerfacecolor','r','markeredgecolor','k');
        count = count + 1;
    end
end
line([1, n_iter], ones(1, 2) * mean(data), 'color', 'r', 'linestyle', '--','linewidth',2)

ylim([12, 18])
% disp(num2str(count))
grid on;
xlabel('반복 추출 횟수');
ylabel('평균값');

%% 정규분포 line만 그려주기

mu = mean(data);
sigma = std(data);

pd = makedist('Normal', 'mu', mu, 'sigma', sigma);

x = linspace(mu - 3 * sigma, mu + 3 * sigma, 100);
y = pdf(pd, x);
figure;
plot(x, y, 'color','k','linewidth',2)
set(gca,'visible','off')
