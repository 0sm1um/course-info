%% Problem 1

Im = [291500 0.052*291500];
Ic = [70410 0.03*70410];
S1 = [0.240 0.015] %m
S2 = [0.240 0.015]
lambda = [500 2.5] %nm
hc = [1239.5 0.01] %eV nm

A = errorDivide(Im,Ic);
S12 = errorMultiply(S1,S2);
B = errorPow(S12,-1);
I = errorMultiply(A,B);
hbaromg=errorDivide(hc,lambda)

%% Problem 2
p = [39.5 2.2] % m
r = [22.5 0.85]

A = 2*errorPow(r,-1)-errorPow(p,-1)
i = errorPow(A,-1)
