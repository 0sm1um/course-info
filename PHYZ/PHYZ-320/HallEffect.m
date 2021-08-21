clear all
syms E0 mu eps0 k z w t

p1=diff(E0*exp(i*(k*z-w*t)),z,2);
p2 = diff(E0*exp(i*(k*z-w*t)),t,2);

if p1 == p2
    x = 1;
end