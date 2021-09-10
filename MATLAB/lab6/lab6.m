%John Hiles

clear all
clc

%% Question One

REnumber(180,240)

%% Question Two

load stormtrack2.dat;
bt=[];
count=0;
hours=0;
s=stormtrack2;

for i=1:24;
    if s(i,2)>=30 && s(i,3)<=.5;
        bt=[bt;s(i,:)];
        count=1+count;
        if count>=4
            hours=hours+1;
        end
    else count=0;
    end
end
bt
disp("There was a blizard!")
%% Question Three

%rh=12.5+(h-19)*tan(atan(3/4))

a=tankvolume(0);
b=tankvolume(10);
c=tankvolume(19);
d=tankvolume(25);
e=tankvolume(33);
volume=[a b c d e]
