% switchletgrade_script inputs an integer quiz avlue and returns the 
% letter grade corresponding to the input using switch

quiz=input('Enter integer quiz grade from 0 to 10: ');
 
% First, error-check
if quiz < 0 || quiz > 10
    grade = 'X';
else
    % If here, it is valid so figure out the
    %  corresponding letter grade using a switch
    switch quiz
        case 10
            grade = 'A'
        case 9
            grade = 'A'
        case 8
            grade = 'B'
        case 7
            grade = 'C'
        case 6
            grade = 'D'
        otherwise
            grade = 'F'
    end
end

