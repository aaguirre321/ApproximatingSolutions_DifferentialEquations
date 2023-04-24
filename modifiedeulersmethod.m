%% Modified Euler's Method
clc

a=2;
b=6;
h=0.005;
N=(b-a)/h;
alpha=1;

f=@(t,y) 1+(t-y)^2;

t=a;
w=alpha;
x=[t];
y=[w];
fprintf('%f \t %f \n',t,w)

for i=1:N
    w=w+(h/2)*(f(t,w)+f(t+h,w+h*f(t,w)));
    t=a+i*h;
    x(end+1)=t;
    y(end+1)=w;
    fprintf('%f \t %f \n',t,w)
end

plot(x,y, '.', 'markersize',8)