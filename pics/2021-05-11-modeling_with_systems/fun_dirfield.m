function fun_dirfield(func,tval,yval, varargin)
% 1차 미분방정식에 대한 방향장을 그려주는 함수
%
% 여기서 1차 미분방정식은 다음과 같은 꼴을 말함.
%
% dy/dt = f(t, y)
%
% 혹은 비제차 미분방정식의 형태인 경우에는 다음과 같은 형태도 고려할 수 있음.
% 이 경우에는 plot이 animation이 됨.
% dy/dt = f(t, y) + p(t)
%
% [입력]
%
% func: 함수 핸들 입력
% tval: x축에 화살표가 표현될 위치들을 그릴 것. 가령 linspace(-1, 1, 10) 이라고 하면 -1과 1사이에 10개의
% 화살표가 그려지게 될 것임.
% yval: 위와 마찬가지이나 y 축에 화살표가 표현될 위치들을 그릴 것.
%
% [사용 예시]
%
% fun_dirfield(@(t,y) 1/4.y^3, linspace(-4, 4, 10), linspace(-4, 4, 10));
%
% (c) 공돌이의 수학정리노트 2021/05/12

params = inputParser;
params.CaseSensitive = false;
params.addParameter('p', @(t) 0); % nonhomogenous forcing을 위한 용도
params.addParameter('newFigure', false);
params.addParameter('color',0.5 * ones(1,3))
params.addParameter('linewidth',1)

params.parse(varargin{:});

p = params.Results.p;
h_fig = params.Results.newFigure;
color = params.Results.color;
linewidth = params.Results.linewidth;

if nargin == 2
    yval = tval;
end

if h_fig
    figure;
end

[tm,ym]=meshgrid(tval,yval);

dt = tval(2) - tval(1);
dy = yval(2) - yval(1);
yp=feval(func,tm,ym) + feval(p, tm);
s = 1./max(1/dt,abs(yp)./dy)*0.35;
quiver(tval,yval,s,s.*yp,0,'.','color',color,'linewidth',linewidth);
quiver(tval,yval,-s,-s.*yp,0,'.','color',color,'linewidth',linewidth);
grid on;
axis tight;
hold on;

xlabel('$t$','interpreter','latex');
ylabel('$x$','interpreter','latex');