% Logistic map

close all

x = [0:0.01:1];

r = 3.8;
f = @(x) r*x.*(1-x); %Logistic Map

fix = 1 - 1/r; %Fixed point

figure()
hold on

plot(x,f(x),x,x)
text(0.5,0.5,sprintf('fixed point %g',fix))

t = [1,1]*0.2; %Initial point for iteration
for i = 1:25
    y = [t(1),f(t(1))];
    plot(t,y,'k')
    %pause(0.1);
    t = [f(t(1)),f(t(1))];
    plot(y,t,'k')
    %pause(0.1);
end

N = 30; %Number of iterations
y1 = ones(N,1);
y2 = ones(N,1);

t1 = 0.2;
y1(1) = f(t1);
t2 = 0.2 + 1E-5;
y2(1) = f(t2);

for i = 1:N-1
    if abs(y1(i) - y2(i)) > 0.2
        j = i;
    end
    y1(i+1) = f(y1(i));
    y2(i+1) = f(y2(i));   
end

figure()
hold on

plot(1:N,y1,'b')
plot(1:N,y2,'r')
text (5,0.2,sprintf('Separation exceed 0.2 at j = %g',j))
legend('x_0 = 0.2','x_0 = 0.2 + 1E-5')