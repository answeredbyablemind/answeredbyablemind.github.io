clear; close all; clc;

% rng(4)
% data = round(randn(1,150)* 2 + 15);
load('data.mat')

%% Fig. 3 세 번 표본 추출

n_sample = 6;
n_iter = 100;
SEM = zeros(1, n_iter);
mns = zeros(1, n_iter);
for i_smpl = 1:n_iter
    n_randperm = randperm(150);
    
    data_sampled = data(n_randperm(1:n_sample));

    mns(i_smpl) = mean(data_sampled);
    SEM(i_smpl) = std(data_sampled)/sqrt(n_sample);
end

figure;
line([1, 100], ones(1, 2) * mean(data), 'color', 'r', 'linestyle', '--')
line([1, 100], ones(1, 2) * (mean(data) +2*std(data)/sqrt(n_sample)), 'color', 'b', 'linestyle', '--')
line([1, 100], ones(1, 2) * (mean(data) -2*std(data)/sqrt(n_sample)), 'color', 'b', 'linestyle', '--')
hold on;
for i = 1:n_iter
    plot(i, mns(i), 'o', 'markerfacecolor','k');
    line([i i], [mns(i) - SEM(i), mns(i) + SEM(i)], 'color','k')
end

%% Fig 4. 무수히 많은 표본 추출 & 평균

figure('position',[125.800000000000,287.400000000000,1331.20000000000,420.000000000000],'color','w');

mns2draw = [];
my_max = 8.78;

n_step = 100;
sample_size = 6;

for i = 1:n_step
    idx_perm = randperm(length(data),sample_size);
    k_data = unique(data);
    subplot(1,2,1);
    
    for i_data = 1:length(k_data)
        idx = data == k_data(i_data);
        find_idx = find(idx);
        
        for i_idx = 1:sum(idx)
            plot(data(find_idx(i_idx)), i_idx, 'o','markersize',mksize,'markerfacecolor',ones(1,3) * 0.8, 'markeredgecolor','k');
            hold on;
        end
    end
    xlim([8 22])
    ylim([0, 40])
    grid on;
    xlabel('height(cm)');
    ylabel('count');
    title('금성에 사는 외계인 150명의 키');
    
    data_sort = sort(data);

    plot(data_sort(idx_perm), my_order(idx_perm),'o','markersize',mksize,'markerfacecolor','r',...
        'markeredgecolor','none');

    subplot(1,2,2);
    
    k_data = unique(mns2draw);
    
    for i_data = 1:length(k_data)
        idx = mns2draw == k_data(i_data);
        find_idx = find(idx);
        
        for i_idx = 1:sum(idx)
            plot(mns2draw(find_idx(i_idx)), i_idx, 'o','markersize',mksize ,'markerfacecolor',ones(1,3) * 0.8, 'markeredgecolor','k');
            hold on;
        end
        
        if sum(idx) > my_max
            my_max = sum(idx);
        end
        
    end
    
    temp_mean= mean(data(idx_perm));
    
    temp_mean = round(temp_mean);
    
    ycoord = sum(mns2draw == temp_mean) + 1;
    plot(temp_mean, ycoord, 'o','markersize',mksize,'markerfacecolor',ones(1,3) * 0.8, ...
        'markeredgecolor',[1, 0.325 0.098],'linewidth',4);
    hold on;
    mns2draw = [mns2draw temp_mean];
    
    xlim([8 22])
    if i== 1
        ylim([0, 40]);
    end
    
    if ycoord > 40
        ylim([0, ycoord]);
    end
    
    grid on;
    xlabel('height(cm)');
    ylabel('count');
    title('n=6인 샘플을 100회 뽑고 각각의 평균을 도시한 것');
    
    drawnow;
%     pause;
    
    if i < n_step
        subplot(1,2,1); cla;
        subplot(1,2,2); cla;
    else
        subplot(1,2,2); cla;
        
        k_data = unique(mns2draw);
        
        for i_data = 1:length(k_data)
            idx = mns2draw == k_data(i_data);
            find_idx = find(idx);
            
            for i_idx = 1:sum(idx)
                plot(mns2draw(find_idx(i_idx)), i_idx, 'o','markersize',mksize ,'markerfacecolor',ones(1,3) * 0.8, 'markeredgecolor','k');
                hold on;
            end
            
            if sum(idx) > my_max
                my_max = sum(idx);
            end
            
        end
    end
end
