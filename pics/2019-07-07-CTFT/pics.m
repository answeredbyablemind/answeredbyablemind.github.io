clear; close all; clc;
%%
tau = 0.5;

for i_T = [2, 4, 8, 16]
    T = i_T;
    A = 2;
    figure('position',[680, 558, 1200, 250]);
    
    subplot(1,2,1);
    
    for i = -4:4
        plot([-tau, -tau]+T*i, [0, A],'b');
        hold on;
        plot([-tau, tau]+T*i, [A, A],'b');
        plot([tau, tau]+T*i, [A, 0],'b');
        
        if i ~= 0
            
            if (i*T > -10 ) && (i*T < 10)
                text(i * T, -0.2, ['$$',num2str(i),'T$$'],'fontsize',12,'interpreter','latex','HorizontalAlignment','center');
            end
            
        else
            text(i * T, -0.2, '$$0$$','fontsize',12,'interpreter','latex','HorizontalAlignment','center');
        end
        
    end
    
    ylim([-0.5, 3])
    xlim([-10, 10])
    
    h = Annotate(gca,'arrow', [-10, 10], [0, 0]);
    h.Primitive.Color = 'k';
    h = Annotate(gca,'arrow', [0, 0], [0, 3]);
    h.Primitive.Color = 'k';
    set(gca,'visible','off')
    text(10, -0.2, '$$t$$','fontsize',15,'interpreter','latex','HorizontalAlignment','center');
    text(1.2, 2.9, '$$x(t)$$','fontsize',15,'interpreter','latex','HorizontalAlignment','center');
    text(0.5, 2.15, 'A','fontsize',15,'interpreter','latex','HorizontalAlignment','center');
    
    k = (-5*T):(5*T);
    c_k = 2*A*tau/T*sinc(2*k*tau/T);
    
    t = linspace(k(1), k(end), 100);
    c_t = 2*A*tau/T*sinc(2*t*tau/T);
    
    subplot(1,2,2);
    if i_T ~= 16
        stem(k, c_k,'k','linewidth',2)
        hold on;
        plot(t, c_t,'--')
        % set(gca,'fontname','³ª´®°íµñ');
    else
        plot(t, c_t,'-')
        set(gca,'xtick',[]);
        
    end
    set(gca,'ytick',[]);
end