function REnumber(V,D)
renum = ((V*D)/178.01)
if renum<=2300
    disp('Laminar Flow')
elseif renum<=4000
        disp('Transition Period')
    else disp('Turbulent Flow')
    end
end