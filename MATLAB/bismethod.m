function [xn k error] = bismethod(f,a,b,tol)

%function returns an estimate for the root, xn, and requires
%inputs of the function, g, the interval endpoints, a and b,
%the desired tolerance for the error, tol.

error=abs(b-a);              %initialize error
k=0;                         %initialize step counter
while error>tol
    k=k+1;                   %increment counter
    xn=(a+b)/2;              %calculate xn, the midpoint of a and b
    if f(a)==0 || f(b)==0   %check f(a) and f(b)
        %disp('endpoint is root!')
        break
    elseif f(xn)*f(a)<0     % check product of f(xn) and f(a)
        b=xn;%If product < 0 then root is between a and xn, and xn becomes new b
    else
        a=xn;%If product > 0 then root is between xn and b, and xn becomes new a
    end
    error=abs(b-a);%calculate new error
end
end

         