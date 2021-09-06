function [y] = myfun1(x)
    if x < -1
        y = 0;
    elseif x > 1
        y = 1;
    else
        y = 2-abs(2*x);
    end
end