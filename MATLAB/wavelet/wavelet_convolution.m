function res = wavelet_convolution(f, T)
f_len = length(f);
f_hat = [f, zeros(1, T)];
h = my_psi(T);
h_hat = [h, zeros(1, f_len)];

res = ifft(fft(f_hat).*fft(h_hat));
% res = fftshift(res);
res = res(round(T/2):end-round(T/2));


end