clear; 

dataset = [17.23, 13.93, 15.78, 14.91, 18.21, 14.28, 18.83, 13.45, 18.71, 18.81, 11.29, 13.39, 11.57, 10.94, 15.52, 15.25];

estimator = @(x) log(std(x)^2);
rng(1)
for i = 1:5000
    bootstrap_sample(i,:)=datasample(dataset, length(dataset));
    val(i)=estimator(bootstrap_sample(i,:));
end

figure;
histogram(val)

CI(1) = prctile(val, 0.025*100);
CI(2) = prctile(val, (1-0.025)*100);

h(1) = line(ones(1,2) * CI(1), ylim, 'color','r','linestyle','--','linewidth',2);
line(ones(1,2) * CI(2), ylim, 'color','r','linestyle','--','linewidth',2)
h(2) = line(ones(1,2)*log(5), ylim,'color','b','linestyle','--','linewidth',2);
xlabel('estimator values'); ylabel('frequency');
grid on;
title('Bootstrap distribution')
leg = legend(h, '95 percentile CI', 'true value', 'location','NW');
set(leg,'fontsize',12);
set(gca,'fontsize',12);

%% sample distribution

for i = 1:5000
    sample_vals(i)=estimator(randn(1,length(dataset))*sqrt(5)+15);
end

figure;
histogram(sample_vals)

CI(1) = prctile(sample_vals, 0.025*100);
CI(2) = prctile(sample_vals, (1-0.025)*100);

line(ones(1,2) * CI(1), ylim, 'color','r','linestyle','--')
line(ones(1,2) * CI(2), ylim, 'color','r','linestyle','--')
line(ones(1,2)*log(5), ylim,'color','b','linestyle','--')

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