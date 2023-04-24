a = 2.0;
b = 6.0;
h = 0.005;
N = (b-a)/h;
alpha=1;

f = @(t,y) 1+(t-y)^2;
y = @(t) t + 1/(1-t);

t = zeros(1,N+1);
w = zeros(1,N+1); 
t(1) = a;
w(1) = alpha;
fprintf('t \t\t y \t\t exact_error \n')
fprintf('%f \t %f \n', t(1),w(1))

t(2)= a + h;
w(2) = w(1) + (h/2) * (f(t(1),w(1))+f(t(1)+h,w(1)+ h*f(t(1),w(1))));

exact_error = abs(w(2)-y(t(2)));
fprintf('%f \t %f \t %f \n', t(2),w(2),exact_error)

for i = 2:N
    
    t(i+1)= a + i*h;
      
    w_temp = w(i) + h * ((3/2)*f(t(i),w(i))-(1/2)*f(t(i-1),w(i-1)));
    
    
    w(i+1) = w(i) + (h/2) * (f(t(i+1),w_temp) + f(t(i),w(i)));
    
    exact_error = abs(w(i+1)-y(t(i+1)));
    fprintf('%f \t %f \t %f \n', t(i+1),w(i+1),exact_error)
    
    
end


