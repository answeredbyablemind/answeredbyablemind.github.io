function [z] = find_roots(f, NR) 
% https://kr.mathworks.com/matlabcentral/answers/4308-finding-the-first-50-roots
% NR: The number of roots to find

N = 150; % Fineness of the search, bigger is finer z = zeros(1,N);

rcnt = 1; % The root counter
cnt = 0;  % The loop counter
while rcnt<=NR 
    cnt = cnt + 1;
    for n = 1:N 
        try z(rcnt) = fzero(f,cnt+[(n-1)/N n/N]); % 매우 작은 간격 안에서만 해를 구해가는 과정을 찾는다.
            if abs(f(z(rcnt)))>1e-8 % fzero에서는 해라고 말했지만 실제 함수값에 넣어보니 1e-8 보다 크다 --> 실제 해가 아님.
                z(rcnt) = nan; % FZERO was messing with us
            else
%                 fprintf('Found a root at: %.5f\n',z(rcnt)) 
                rcnt = rcnt + 1;
                break % Put here only if root spacing is >1!
            end
        catch
        end
    end
end
% x = 0:pi/50:max(z); 
% plot(x,f(x),'-',z,zeros(1,length(z)),'o') 
% line([0 max(z)],[0 0],'color','black') 
% axis([0 max(z) -1000.0 3000.0]) 
z = z(~isnan(z)); % Return only the needed values
end
