clear all
clc
t0 =0; y0=0; T=1; f=@(t,y) sin(t)+y;
y=@(t) 0.5*(exp (t)-sin(t)-cos(t));
Nh =2;
for k=1:10;
[tt ,u]= beuler(f,[t0 ,T],y0 ,Nh);
e(k)=max(abs(u-y(tt))); Nh=2*Nh;
end
p=log(abs(e(1:end -1)./e(2:end )))/log(2);p(1:2:end);