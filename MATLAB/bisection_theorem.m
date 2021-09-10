function M = bisection_theorem(a,b,tol)

Mtemp = (log(b-a)-log(tol))/log(2);
M=ceil(Mtemp);
end