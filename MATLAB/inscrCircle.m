function REnumber = renum(V,D,)
renum = ((V*D)/178.01)
if renum<=2300
    REnumber='Laminar Flow'
else if 2300<REnum<=4000
        REnumber= 'Transition Period'
    else 
end