function sum = taylorSin(x,n)

sum=0;                   %Initial Sum
for i = 0:n
    sum = sum + (-1)^(i) * x^(2*i+1) / factorial(2*i+1);
    i = i + 1;
end
end