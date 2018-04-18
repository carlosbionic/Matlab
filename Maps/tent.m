x = [0:0.01:1];
%n = 1;
f = @(x) 1 - 2*abs(x - 1/2); %Tent Map



plot(x,f(f(x)))
%axis([0 1 0 1])