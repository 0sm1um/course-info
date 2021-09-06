clear all
clc
%% Question 2.
%a)
x = [5:1:29];
disp=[length(x)];
%b)
y = 10+(13-10)*rand(1,25);
%c) 
v = x+y;
%d) Plot what with what?
plot(v);
%e)
c = x./y;
d = v.^3;
dotProd = dot(x,y)
%f)
plot(v(1:2:end))
%g)
plot(v(14:1:23))
%h) Plot what with what?
figure
hold on
plot(x, 'b');
plot(y, 'g');
%i) 
figure 
hold on
plot(c, 'r');
plot(d,'g');

%% Question 3.
%a)
x = linspace(-2.5,2.5,100);
y = zeros(length(x));
for i = [1:length(x)]
    y(i) = myfun1(x(i));
end
%b)
figure
plot(x,y, 'b')
%c)
test1 = myfun2([2,-8,3,12]);
test2 = myfun2([1:10]);
%d)
