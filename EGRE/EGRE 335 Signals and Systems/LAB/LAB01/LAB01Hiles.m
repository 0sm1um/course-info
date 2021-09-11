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
figure
plot(v);
title('Question 2d Plot')
%e)
c = x./y;
d = v.^3;
dotProd = dot(x,y);
%f)
figure
plot(v(1:2:end));
title('Question 2f Plot')
%g)
figure
plot(v(14:1:23))
title('Question 2g Plot')
%h) Plot what with what?
figure
hold on
plot(x, 'b');
plot(y, 'g');
title('Question 2h Plot')
%i) 
figure 
hold on
plot(c, 'r');
plot(d,'g');
title('Question 2i Plot')

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
title('Question 3b Plot')
%c)
test1 = myfun2([2,-8,3,12]);
test2 = myfun2([1:10]);
%d&e)
x = [0:0.05:5]; m=2.5; s=0.8;
myfun3(x,m,s)

%% Question 4
%a)
x = [0 1 2+8*j 3+7*j 4+6*j 5+5*j 6+4*j 7+3*j 2*j j];
%b)
figure
hold on
subplot(2,2,1);
plot(real(x))
title('Real Component')
subplot(2,2,2);
plot(imag(x))
title('Imaginary Component')
subplot(2,2,3);
plot(abs(x))
title('Magnitude')
subplot(2,2,4);
plot(angle(x))
title('Angle')

%c)
myfun4(x);

%% Function Dump
function [y] = myfun1(x)
    if x < -1
        y = 0;
    elseif x > 1
        y = 1;
    else
        y = 2-abs(2*x);
    end
end
function [sum] = myfun2(x)
    if length(x) <= 2
        disp(['Invalid input vector length'])
    else
        sum = 0;
        negativeindicies = [];
        for i=1:length(x)
            if sign(x(i)) == -1
                sum = sum + x(i);
                negativeindicies = [negativeindicies i];
            end
        end
        for i = negativeindicies; x(i) = []; end
        primeIndicies = isprime(x);
        for i = 1:length(primeIndicies)
            if primeIndicies(i) == 0
                sum = sum+x(i);
            end
        end
    end
end
function [] = myfun3(x, m, s)
if isvector(x) == false || isscalar(m) == false || isscalar(s) == false
    disp(['Incompatible inputs, try again ding dong.'])
end
y = 1/(s * sqrt(2*pi)) * exp(-(1/2)*((x-m)/(s)).^2);
figure
plot(x,y)
title('myfun3 Plot')
end
function [y] = myfun4(x)
%I took a slightly different approach. I first created a new array with the
%desired values, then printed that array. An alternate solution would
%involve replacing line 11 with "disp([num2str(x(i))])" statement.
if isreal(x) == true
    disp(['Its all real dawg'])
end
y = [];
for i = [1:length(x)]
    if (isreal(x(i)) == false) && (real(x(i)) == 0)
        y = [y imag(x(i))];
    end
end
disp([y])
end