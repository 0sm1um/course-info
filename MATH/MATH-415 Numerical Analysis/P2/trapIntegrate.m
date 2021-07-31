function [I] = trapIntegrate(a,b,fa,fb)
%trapIntegrate
%Arguments:
% a  --- Initial value
% b  --- Final value
% fa --- Initial function value 'f(a)'
% fb --- Final function value 'f(b)'
I = (b-a)/2*(fa+fb);
end