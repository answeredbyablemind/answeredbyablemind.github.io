function Y = my_conv(x, h)

m=length(x);
n=length(h);
X=[x,zeros(1,n)];
H=[h,zeros(1,m)];
for i=1:n+m-1 % H에 대한 iteration
    Y(i)=0;
    for j=1:m % X에 대한 iteration
        if(i-j+1>0)
            Y(i)=Y(i)+X(j)*H(i-j+1);
        else
            
        end
    end
end

end