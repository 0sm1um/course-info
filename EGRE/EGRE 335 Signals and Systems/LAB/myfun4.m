function [y] = myfun4(x)
%I took a slightly different approach. I first created a new array with the
%desired values, then printed that array. An alternate solution would
%involve replacing line 11 with "disp([num2str(x(i))])" statement.
if isreal(x) == true
    disp(['Its all real dawg'])
end
y = [];
for i = [1:length(x)]
    if (isreal(x(i)) == false) && (real(x(i)) == 0)
        y = [y imag(x(i))];
    end
end
disp([y])
end