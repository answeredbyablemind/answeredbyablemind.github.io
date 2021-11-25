%% 엑셀에 테이블 만들기 (7개 중 3개 선택하는 경우의 수)

my_select = nchoosek(1:7, 3);

for i = 1:size(my_select,1)
    temp_str = '       ';
    temp_str(my_select(i,:)) = 'o';
    xlswrite('select_table.xlsx', temp_str, 1, ['A',num2str(i)]);
    xlswrite('select_table.xlsx', sum(my_select(i,:)), 1, ['H',num2str(i)])
end

%%

sum_of_ranks = sum(my_select, 2);

figure;
w = histogram(sum_of_ranks);
grid on;
xlabel('순위합 T');
xlim([4, 20])
ylim([0, 6])
set(gca,'ytick',0:5)
ylabel('빈도')
title('7개 중 3개 조합의 순위합 분포')
set(gca,'fontname','나눔고딕')