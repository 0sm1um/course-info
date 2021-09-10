function Temp = system(T0,Tm,t)
Temp = Tm+(T0-Tm)*exp(-.03*t)
end