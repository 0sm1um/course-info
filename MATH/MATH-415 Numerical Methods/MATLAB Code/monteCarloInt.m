monteCarloInt(x^2,0,2,.05)

function [f,xi,xf,error] = monteCarloInt(f,xi,xf,tol)
fnmax(f,[xi,xf])
while error>tol

end

end