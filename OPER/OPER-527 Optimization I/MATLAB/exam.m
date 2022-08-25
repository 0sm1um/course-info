clc;clear all;

%{
x = linspace(0,20,100)

y1 = -x+.10;
y2 = -(x-80)/10
y3 = 0.4 * x - 2

figure()
hold on
plot(x,y1);
plot(x,y2);
plot(x,y3);
legend('y1','y2','y3')
%}
x = linspace(-5,5,100)
y1 = -0.2*x + 10
y2 = x.^2/10
y3 = 2.*x.*sin(x)
figure()
hold on
plot(x,y1);
plot(x,y2);
plot(x,y3);
legend('y1','y2','y3')

objFunc = @(x,y) exp(-abs(x - y)/5) * (-x^2/10*sin(x) - y^2/15*cos(y))
lowerB= @(x) x^2/10
upperB = @(x) 2*x*sin(x)
upperUpperB = @(x) -x+10;
x0 = [0,0]

for i=[1:100000]
    xn = stochoptimizer2D(objFunc,x0,10)
    if (xn(2) > lowerB(xn(1)) && xn(2) < upperB(xn(1)) && xn(2) < upperUpperB(xn(1)))
        %This is determining if new point is in feasible region.
        x0 = xn
    end
end
function [xn] = stochoptimizer2D(f,x0,sigma)
  %Note: Input must be in a function handle. "@(x) x^2..." format
xi = x0+normrnd(0,sigma,1,2)
if (f(xi(1),xi(2)) > f(x0(1),x0(2)))
    xn = xi
else
    xn = x0
end
end
