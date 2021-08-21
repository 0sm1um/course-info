%% Question 1

hc = [1239.50 0.03]; %nm
n = [2.33 0.12]; %units
costh = [0.999 0.001]; %units
deltaE = [27.2 1.2]; %meV

phi = 2* errorMultiply(n,deltaE);

denominator = errorMultiply(phi,costh) * 10^-3;

finalAnswer = errorDivide(hc,denominator)

altFinalAnswer = errorMultiply(hc, errorPow(denominator,-1))

%% Question 2

epsi = [8.854187 0.000001]*10^-12;
a = [4.35 0.15]*10^-2;
b = [9.35 0.25]*10^-2;

ab = errorMultiply(a,b);
bsuba=errorAdd(b,-a);

phi = errorDivide(ab,bsuba);

ansnum2 = 4*pi*errorMultiply(epsi,phi)