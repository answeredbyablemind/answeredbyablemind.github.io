clear; close all; clc;
W_list = [];
for i = 0:2^6-1
    template = '000000';
    my_bin = dec2bin(i);
    template(end-(length(my_bin)-1):end) = my_bin;
    
    template = fliplr(template);
    
    template = replace(template,{'0','1'},{'-','+'});
    
    % sum of signed ranks
    
    my_sum = 0;
    for j = 1:6
        eval(['my_sum = my_sum + ', template(j), '1 * j;']);
    end
    W_list = [W_list, my_sum];
    
%     xlswrite('possible_combs.xlsx', template, 1, ['A',num2str(i+1)])
%     xlswrite('possible_combs.xlsx', my_sum, 1, ['G',num2str(i+1)])
end

%%

figure('position',[680, 558, 1000, 420]);
my_hist = histogram(W_list,'BinWidth', 2);
xlabel('sum of signed ranks, W');
ylabel('빈도');
grid on;
set(gca,'fontname','나눔고딕')
title('가능한 모든 조합의 W 분포')
set(gca,'ytick', 1:5)