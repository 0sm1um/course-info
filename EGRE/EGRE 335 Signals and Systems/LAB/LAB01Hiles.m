clear all
clc
%% Question 2
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
