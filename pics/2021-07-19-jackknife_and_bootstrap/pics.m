clear; 
dataset = randn(1,30)*5+10;

estimator = @(x) log(std(x)^2);

for i = 1:1000
    bootstrap_sample(i,:)=datasample(dataset, 30);
    val(i)=estimator(bootstrap_sample(i,:));
end

figure;
histogram(val)


%%
rng(1)
tbl = zeros(5,7);
for i = 1:5
    tbl(i,:)=datasample(1:7,7);
end

tbl

%%
my_color = [...
    252, 68, 68;
    255, 165, 0;
    251, 219, 4;
    139, 195, 74;
    3, 169, 244;
    4, 60, 140;
    103, 58, 183]/255;

figure;
for j = 1:7
    plot(j, 0, 'o','markerfacecolor',my_color(j,:),'markeredgecolor','k','markersize',40,'linewidth',2)
    hold on;
    if j < 5
        text(j,0,num2str(j),'HorizontalAlignment','center','color','k','FontName','arialblack','fontsize',12,'fontweight','bold')
    else
        text(j,0,num2str(j),'HorizontalAlignment','center','color','w','FontName','arialblack','fontsize',12,'fontweight','bold')
    end
end
set(gca,'visible','off')

figure;
for i = 1:5
    for j = 1:7
        plot(j, -i, 'o','markerfacecolor',my_color(tbl(i,j),:),'markeredgecolor','k','markersize',40,'linewidth',2)
        hold on;
        if tbl(i,j) < 5
            text(j,-i,num2str(tbl(i,j)),'HorizontalAlignment','center','color','k','FontName','arialblack','fontsize',12,'fontweight','bold')
        else
            text(j,-i,num2str(tbl(i,j)),'HorizontalAlignment','center','color','w','FontName','arialblack','fontsize',12,'fontweight','bold')
        end
    end
end
set(gca,'visible','off')