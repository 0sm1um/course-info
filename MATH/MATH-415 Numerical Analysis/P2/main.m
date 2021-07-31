%% Main Code
clear all;clc
[vx,vy,t,vxActual,vyActual] = velDataGenerator(50,45,1,1);
i = 1;Iy = [0];
while true
    Iy(i+1) = trapIntegrate(t(i),t(i+1),vy(i),vy(i+1)) + Iy(i);
    if Iy(end) <= 0
        fy = linearInterpolator(t(i),t(i+1),vy(i),vy(i+1));
        for interpTime = linspace(t(i),t(i+1),1000)
            Iy(i+1)=trapIntegrate(t(i),interpTime,vy(i),fy(interpTime))+Iy(i);            
            if Iy(end) <= 0
                break
            end
        end
        break
    end
    i = i+1;
end
Ix = 0;
for i=[1:i]
    Ix(i+1) = trapIntegrate(t(i),t(i+1),vx(i),vx(i+1)) + Ix(i);
end
fx = linearInterpolator(t(i),t(i+1),vy(i),vy(i+1));
Ix(i+1)=trapIntegrate(t(i),interpTime,vy(i),fy(interpTime))+Ix(i);
%Calculate Error
syms h
xActual=double(int(vxActual,h,0,interpTime));
yActual=double(int(vyActual,h,0,interpTime));
Yerror = abs(yActual-Iy(end));Xerror = abs(xActual-Ix(end));

%% Part 2 Plots
figure
plot(t,vy)
axis([0 t(end) min(vy) max(vy)])
title('Vertical Velocity versus Time')
ylabel('Vertical Velocity (m/s)')
xlabel('Time (s)')

figure
plot(t,vx,'r')
axis([0 t(end) min(vx) max(vx)])
title('Horizontal Velocity versus Time')
ylabel('Horizontal Velocity (m/s)')
xlabel('Time (s)')
%axis equal
%plot(Ix,Iy)
%% Part 5
figure
plot(linspace(0,interpTime,length(Iy)),Iy)
axis([0 t(end) min(Iy) max(Iy)])
title('Vertical Displacment versus Time')
ylabel('Vertical Displacment (m)')
xlabel('Time (s)')

figure
plot(linspace(0,interpTime,length(Ix)),Ix,'r')
axis([0 t(end) min(Ix) max(Ix)])
title('Horizontal Displacment versus Time')
ylabel('Horizontal Displacment (m)')
xlabel('Time (s)')

%% Part 6
%Calculating Terminal Velocity
[TermVx,TermVy,t] = termVelGenerator(50,45,1,1);
figure
plot(t,TermVy,'g')
title('[Terminal Velocity] Vertical Displacment versus Time')
ylabel('Vertical Displacment (m)')
xlabel('Time (s)')

terminalVelocity=mean(TermVy(end-500:end))
standardErrorofTermVel=std(TermVy(end-500:end))/sqrt(500)