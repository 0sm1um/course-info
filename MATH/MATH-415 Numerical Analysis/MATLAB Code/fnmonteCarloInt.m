syms(x)
newtmethod(x^2-2,0,.05)

%{
function [f,xi,xf,error] = monteCarloInt(f,xi,xf,tol)
fnmax(f,[xi,xf])
fnmin(f,[xi,xf])
while error>tol

end

end
%}