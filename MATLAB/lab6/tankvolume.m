function volume=tankvolume(h)
r=12.5+(h-19)*3/4;

if h<=19
volume = pi*12.5^2*h;

else
    volume = pi*12.5^2*19+(pi*(h-19)/3)*(12.5^2+12.5*r+r^2);
        
end