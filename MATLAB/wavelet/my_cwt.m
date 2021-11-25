function res = my_cwt(f, varargin)

params = inputParser;
params.CaseSensitive = false;
params.addParameter('t0', 20);

params.parse(varargin{:});
%Extract values from the inputParser
t0 = params.Results.t0;

f_len = length(f);
ii=1;
res = [];
for x = t0:10:f_len
    temp = wavelet_convolution(f, x);
%     if x == t0
%         len2cut = length(temp);
%     end
%     temp = temp(1:len2cut);
    res = [res; temp];
    ii=ii+1;
end

end