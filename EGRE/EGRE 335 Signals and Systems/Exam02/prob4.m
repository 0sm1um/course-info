

t1 = [-10:0.1:-2];
t2 = [-2:0.1:0];
t3 = [0:0.1:4];
t4 = [4:0.1:10];
shiftt1 = [-10:0.1:-2] + 2;
shiftt2 = [-2:0.1:0] + 2;
shiftt3 = [0:0.1:4] + 2;
shiftt4 = [4:0.1:10] + 2;
scalet1 = [-10:0.1:-2]/.2;
scalet2 = [-2:0.1:0]/.2;
scalet3 = [0:0.1:4]/.2;
scalet4 = [4:0.1:10]/.2;

tplot = [t1 t2 t3 t4];
tshift = [shiftt1 shiftt2 shiftt3 shiftt4]
tscale = [scalet1 scalet2 scalet3 scalet4]

x1 = elsefunc(t1);
x2 = leftfunc(t2);
x3 = rightfunc(t3);
x4 = elsefunc(t4);
shiftx1 = elsefunc(shiftt1);
shiftx2 = leftfunc(shiftt2);
shiftx3 = rightfunc(shiftt3);
shiftx4 = elsefunc(shiftt4);
scalex1 = elsefunc(scalet1);
scalex2 = leftfunc(scalet2);
scalex3 = rightfunc(scalet3);
scalex4 = elsefunc(scalet4);

xplot = [x1 x2 x3 x4];
shiftxplot = [shiftx1 shiftx2 shiftx3 shiftx4];
scalexplot = [scalex1 scalex2 scalex3 scalex4];

figure()
plot(tplot,xplot)
hold on
plot(tshift, xplot)
plot(tscale, scalexplot)
legend('f(t)', 'f(t-2)', 'f(t/2)')
title('Scaled Signal vs unscaled signals.')
xlabel('time (s)')
ylabel('Voltage (V)')

function y1 = rightfunc(t)
y1= 1 + 0.5*t;
end
function y1 = leftfunc(t)
y1=1 - 0.5*t;
end
function y1 = elsefunc(t)
y1=zeros(1,length(t));
end


