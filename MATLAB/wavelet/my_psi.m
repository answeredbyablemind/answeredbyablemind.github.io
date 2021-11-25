function y = my_psi(T,varargin)

params = inputParser;
params.CaseSensitive = false;
params.addParameter('f0', 6);

params.parse(varargin{:});
%Extract values from the inputParser
f0 = params.Results.f0;

x = linspace(-2*pi, 2*pi, T);

y = pi^(1/4) * exp(1i * f0 * x - x.^2 / 2);

end