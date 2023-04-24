% create mesh of equispaced points in time
N = 400; 
tvals = linspace(0., 4*pi, N); 
h = tvals(2)-tvals(1) ;  % step size

t = zeros(N,1);
xvals = zeros(N,1); % create blank arrays
wvals = zeros(N,1); % to be edited below 
exact_error= zeros(N,1);

t(1) = 0;
xvals(1) = 1.0; % initial value for x
wvals(1) = 0.0;  % initial value for w
exact_error(1) = 0.0;

f1 = @(t,x,w) w;
f2 = @(t,x,w) -x;

u = @(t) cos(t);

for i = 1:N-1
    % implement RK-4 method here
    t(i+1)= 0 + i*h;
    
    k(1,1) = h * f1(t(i), xvals(i), wvals(i));
    k(1,2) = h * f2(t(i), xvals(i), wvals(i));
    
    k(2,1)= h * f1(t(i)+h/2, xvals(i) + (1/2) * k(1,1), wvals(i)+(1/2)*k(1,2));
    k(2,2)= h * f2(t(i)+h/2, xvals(i) + (1/2) * k(1,1), wvals(i)+(1/2)*k(1,2));
    
    k(3,1) = h * f1(t(i)+h/2, xvals(i) + (1/2) * k(2,1), wvals(i)+ (1/2)*k(2,2));
    k(3,2) = h * f2(t(i)+h/2, xvals(i) + (1/2) * k(2,1), wvals(i)+(1/2)*k(2,2));
    
    k(4,1) = h * f1(t(i+1), xvals(i) + k(3,1), wvals(i)+ k(3,2));
    k(4,2) = h * f2(t(i+1), xvals(i) + k(3,1), wvals(i)+ k(3,2));
    
    xvals(i+1) = xvals(i) + (1/6)*(k(1,1) + 2*k(2,1) + 2*k(3,1) + k(4,1));
    wvals(i+1) = wvals(i) + (1/6)*(k(1,2) + 2*k(2,2) + 2*k(3,2) + k(4,2));
    
    exact_error(i+1) = abs(xvals(i+1)-u(t(i+1)));
    
    
end

figure(1)
plot(tvals, exact_error, 'r')

% make phase plot--plot velocity w versus x
figure(2)
plot(xvals, wvals, 'b')

