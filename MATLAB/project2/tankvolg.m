function volume=tankvolg(ld,ud,hc,hf,wl)

r=ld/2+(wl-hc)*3/4;

if wl<0
    disp("Error: The predicted volume is negative")
end

if wl<=hc
    volume = pi*(ld/2)^2*wl;
    
else
    volume = pi*(ld/2)^2*hc+(pi*(wl-hc)/3)*((ld/2)^2+(ld/2)*r+r^2);
    
    if wl>hc+hf
        disp("Error: The predicted volume is greater than the theoretical maximum of the tank")
    end
    
end
end