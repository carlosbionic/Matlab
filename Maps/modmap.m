x = [0:0.01:1];

f = @(x) mod(2*x,1); 



plot(x,f(x))