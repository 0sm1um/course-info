clear all; clc;
t = linspace(0,10,100)
Ai = [2 5 3]
omg0 = 5
Vin = Vi(Ai(1), omg0, t) + Vi(Ai(2), omg0, t) + Vi(Ai(3), omg0, t)
plot(t, Vin)

omg = [-3*omg0 -2*omg0 -omg0 0 omg0 2*omg0 3*omg0];
BW = 10;
test1 = filterfunc(BW, omg(1));
test2 = filterfunc(BW, omg(2));
test3 = filterfunc(BW, omg(3));
test4 = filterfunc(BW, omg(4));
test5 = filterfunc(BW, omg(5));
test6 = filterfunc(BW, omg(6));
test7 = filterfunc(BW, omg(7));
disp([test1 test2 test3 test4 test5 test6 test7])
function y1 = filterfunc(BW,omg)
y1= rectangularPulse(-BW/2,BW/2,omg);
end

function y1 = Vi(A,omg0, t)
y1= A * cos(j*omg0 * t);    
end
