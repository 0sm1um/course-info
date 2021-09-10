% John Hiles

clear all
clc

%%Question One
% a

maxnamelength=namelengthmax

% b

%xXx-variablethatisnotallowed-xXx=0/0

%%Question Two
% a 

kph = 50+60

% b

mph=kph/1.62

%%Question Three

initial=1
final=20
out=round(initial+(final-initial)*(rand))

%%Question Four
 
n=1
length=2*n+2
vec=[1:1:length]'
top=vec(1:length/2)
bottom=vec(length/2+1:length)

%%Question Five

left=[1:2:49]
right=[51:4:99]
full=[left right]
size(full)

%%Question Six

linspace(0,10,21)'

%%Question Seven

%The Error (which I think is fairly self explainatory) states that the
%"max" is now both a command, and a variable. Because it is both, MATLAB
%cannot tell whether the user is asking it to execute a command, or recall
%a piece of information.