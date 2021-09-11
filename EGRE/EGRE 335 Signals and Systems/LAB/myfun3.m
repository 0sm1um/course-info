function [] = myfun3(x, m, s)
if isvector(x) == false || isscalar(m) == false || isscalar(s) == false
    disp(['Incompatible inputs, try again ding dong.'])
end
y = 1/(s * sqrt(2*pi)) * exp(-(1/2)*((x-m)/(s)).^2);
figure
plot(x,y)
title('myfun3 Plot')
end