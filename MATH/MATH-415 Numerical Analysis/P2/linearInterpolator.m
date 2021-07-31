function [F]= linearInterpolator(a,b,fa,fb)
%linearInterpolator
%Arguments:
% a  --- Initial value
% b  --- Final value
% fa --- Initial function value 'f(a)'
% fb --- Final function value 'f(b)'
F = @(x) (fb-fa)/(b-a)*(x-a);
end