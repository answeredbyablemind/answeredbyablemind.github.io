clear; close all; clc;
% GMM 알고리즘 수동으로 코드 작성

%% Make Synthetic Data
% 가상의 데이터를 만들고자 함. 데이터는 두 개의 그룹으로 나눌 것이며, 평균은 0, 15와 같이 조금 멀리 떨어뜨려놓을 생각.
% 각 그룹의 비율은 7:3으로 진행하고자 함. 즉, phi = [0.7, 0.3]으로 진행.

% 데이터 만들어주기
rng(1)
mu = [0, 15];
vars = [12, 3];
n_data = 1000;
phi = [0.7, 0.3];
X = [];
for i_data = 1:n_data
    if rand(1) < 0.7
        X(end+1) = randn(1) * sqrt(vars(1)) + mu(1);
    else
        X(end+1) = randn(1) * sqrt(vars(2)) + mu(2);
    end
end

% 데이터 분포 확인
figure('position',[628, 334, 774, 577],'color','w'); 
histogram(X, 50,'Normalization','pdf')

xx = linspace(-30, 30, 100);
yy1 = normpdf(xx, mu(1), sqrt(vars(1)));
yy2 = normpdf(xx, mu(2), sqrt(vars(2)));

hold on;
grid on;
plot(xx, yy1 * phi(1)+ yy2 * phi(2), 'k','linewidth',2); % 즉, phi = [0.7, 0.3]
xlabel('x');
ylabel('pdf');

%% GMM 알고리즘 작성

clear h
my_normal = @(x, mu, sigma) 1/(sigma * sqrt(2*pi)).*exp(-1 * (x-mu).^2/(2*sigma^2));

% random initialization
est_mu = [-25, 20];
est_vars = [7, 9.5];

est_w = zeros(n_data, 2);
est_phi = [0.5, 0.5];

est_yy1 = normpdf(xx, est_mu(1), sqrt(est_vars(1)));
est_yy2 = normpdf(xx, est_mu(2), sqrt(est_vars(2)));

h1 = plot(xx, est_yy1 * est_phi(1), 'r','linewidth',4);
h2 = plot(xx, est_yy2 * est_phi(2), 'g','linewidth',4);
t = text(-27, 0.075, 'the first initialization','fontsize',12);

pause;

delete(t);
delete(h1);
delete(h2);

% GMM iteration
n_iter = 50;
for i_iter = 1:n_iter
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%% E-step %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for i_data = 1:n_data
        l1 = my_normal(X(i_data), est_mu(1), sqrt(est_vars(1)));
        l2 = my_normal(X(i_data), est_mu(2), sqrt(est_vars(2)));
        
        est_w(i_data, 1) = (l1 * est_phi(1)) / (l1 * est_phi(1) + l2 * est_phi(2));
        est_w(i_data, 2) = (l2 * est_phi(2)) / (l1 * est_phi(1) + l2 * est_phi(2));
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%% E-step 끝 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%% M-step %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % phi 추정
    est_phi = 1/n_data * sum(est_w, 1);
    
    % mu 추정
    est_mu(1) = (X * est_w(:,1))/sum(est_w(:,1));
    est_mu(2) = (X * est_w(:,2))/sum(est_w(:,2));
    
    % Sigma 추정
    est_vars(1) = sum(est_w(:,1)'.*(X-est_mu(1)).^2)/sum(est_w(:,1));
    est_vars(2) = sum(est_w(:,2)'.*(X-est_mu(2)).^2)/sum(est_w(:,2));
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%% M-step 끝 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % 아래는 그림 그리기 위한 용도
    est_yy1 = normpdf(xx, est_mu(1), sqrt(est_vars(1)));
    est_yy2 = normpdf(xx, est_mu(2), sqrt(est_vars(2)));
    
    h1 = plot(xx, est_yy1 * est_phi(1), 'r','linewidth',4);
    h2 = plot(xx, est_yy2 * est_phi(2), 'g','linewidth',4);
    t = text(-27, 0.075,  ['Epoch: ',num2str(i_iter),' / ',num2str(n_iter)],'fontsize',12);
    pause;
    
    if i_iter < n_iter
        delete(t);
        delete(h1);
        delete(h2);
    end
    
end