function power = errorpow(A,n)
power = [A(1)^n A(1)^n*(A(2)/A(1))*abs(n)];