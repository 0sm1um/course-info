function y=calcy(x)
% This m-file has three different ways of using if-else statements to find
% y for the following piecewise defined function y=f(x):
% y = 1     if x < -1
% y = x^2	if -1 <= x <= 2
% y = 4     if x > 2

% First time, using standard if statements
if x<-1
    y=1;
end
if x>=-1 && x<=2
    y=x^2;
end
if x>2
    y=4;
end
disp('first time')

% Second time, using nested if-else statements
if x<-1
    y=1;
else
    % At this point, have ruled out x < -1. Use an if-else statement to 
    % choose between the remaining 2 ranges
    if x<=2
        y=x^2;
    else
        % At this point, have ruled out x <= 2
        y=4;
    end
end
disp('second time')

% Third time, using elseif statements
if x<-1
    y=1;
elseif x<=2 % At this point, have ruled out x < -1
    y=x^2;
else % At this point, have ruled out x <= 2
    y=4;
end

disp('third time')