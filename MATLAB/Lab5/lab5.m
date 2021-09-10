%John Hiles

clear all
clc

%% Question One

figure

%A

mat1=linspace(0,pi,12);
mat2=linspace(0,pi,80);
mat3=linspace(0,pi,500);

%B

plot(mat1,tan(mat1))
hold on
plot(mat2,tan(mat2))
hold on
plot(mat3,tan(mat3))

xlabel('Angle')
ylabel('Magnitude')
title('tan(x)')

%As the number of points increases, the higher the "resolution" or the
%precision of the plot is.

%At pi/2, the graph aproaches a fininte positive number from the left, and a
%fininte negative number from the right. As the zoom of the plot decreases
%to accomodate the large numbers, the detail of the curve becomes less and
%less obvious. Also the limit of tan(pi/2) does not exist, as it aproaches
%infinity and negative infinity from the left and right. But MATLAB doesn't
%know that.

%% Question Two

figure

%A

V=[1 3; 3 4; 2 5; 2 6; 1 3;]



%B

A=[0 1; 1 0]


%C

W=V*A

%D

Z=linspace(0,6,7)

F=plot(V(:,1),V(:,2),'r--x')
hold on
S=plot(W(:,1),W(:,2),'b:o')
hold on
A=plot(Z,Z)

F(1).Marker='*'

xlabel('X')
ylabel('Y')
title('Funny Shapes')
%% Question Three

area=areasquare(7)