function [sum] = myfun2(x)
    if length(x) <= 2
        disp(['Invalid input vector length'])
    else
        sum = 0;
        negativeindicies = []
        for i=1:length(x)
            if sign(x(i)) == -1
                sum = sum + x(i)
                negativeindicies = [negativeindicies i]
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