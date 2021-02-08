clear; close all; clc;
%{

EM 알고리즘은 likelihood의 최댓값을 찾아가는 과정이라고 하였음.
실제로 plotting이 가능할까?
매 iteration마다 maximum을 찾아가는 과정을 볼 수 있을까?

%}

%% DEFINE
my_normal = @(x, mu, sigma) 1/(sigma * sqrt(2*pi)).*exp(-1 * (x-mu).^2/(2*sigma^2));

%% Make Synthetic Data
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

for i_data = 1:n_data
    l1 = my_normal(X(i_data), mu(1), sqrt(vars(1)));
    l2 = my_normal(X(i_data), mu(2), sqrt(vars(2)));

    w(i_data, 1) = (l1 * phi(1)) / (l1 * phi(1) + l2 * phi(2));
    w(i_data, 2) = (l2 * phi(2)) / (l1 * phi(1) + l2 * phi(2));
end

% 전체 함수에 대한 likelihood 그리기 (mu2에 대해서)

% log-likelihood 계산
my_mu = linspace(-30, 30, 100);
my_L2estimate = zeros(1, length(my_mu));
for i_my = 1:length(my_mu)
    temp = sum(...
        w(:, 2)'.* log(...
        my_normal(X, my_mu(i_my), sqrt(vars(2))) * phi(2) ./ (w(:,2)')));
    my_L2estimate(i_my) = temp;
end

figure; plot(my_mu, my_L2estimate,'k','linewidth',4)
xlabel('\mu_2');
ylabel('Log-Likelihood')

%% GMM
% 모든 다른 parameter들은 고정시켜놓고 GMM iteration 돌려보기
xx = linspace(-30, 30, 100);

clear h
% random initialization
est_mu = [-25, 20];
est_vars = [7, 9.5];

est_w = zeros(n_data, 2);
est_phi = [0.5, 0.5];

% GMM iteration
n_iter = 50;
my_color = jet(n_iter);
for i_iter = 1:n_iter
    
    for i_data = 1:n_data
        l1 = my_normal(X(i_data), est_mu(1), sqrt(est_vars(1)));
        l2 = my_normal(X(i_data), est_mu(2), sqrt(est_vars(2)));
        
        est_w(i_data, 1) = (l1 * est_phi(1)) / (l1 * est_phi(1) + l2 * est_phi(2));
        est_w(i_data, 2) = (l2 * est_phi(2)) / (l1 * est_phi(1) + l2 * est_phi(2));
    end
    
    est_phi = 1/n_data * sum(est_w, 1);
    est_mu(1) = (X * est_w(:,1))/sum(est_w(:,1));
    est_mu(2) = (X * est_w(:,2))/sum(est_w(:,2));
    
    est_vars(1) = sum(est_w(:,1)'.*(X-est_mu(1)).^2)/sum(est_w(:,1));
    est_vars(2) = sum(est_w(:,2)'.*(X-est_mu(2)).^2)/sum(est_w(:,2));
    
    % log-likelihood 계산
    my_mu = linspace(-30, 30, 100);
    my_loglikelihood = zeros(1, length(my_mu));
    for i_my = 1:length(my_mu)
        temp = sum(...
            est_w(:, 2)'.* log(...
            my_normal(X, my_mu(i_my), sqrt(est_vars(2))) * est_phi(2) ./ (est_w(:,2)')));
        my_loglikelihood(i_my) = temp;
    end
    
    hold on;
    plot(my_mu, my_loglikelihood,'color',my_color(i_iter,:))
    pause
end
