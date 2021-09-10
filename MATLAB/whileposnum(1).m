% Prompts the user and echo prints the numbers entered
% until the user enters a negative number

inputnum=input('Enter a positive number: ');
while inputnum >= 0
    fprintf('You entered a %d.\n\n',inputnum)
    inputnum = input('Enter a positive number: ');
end
fprintf('OK!\n')

%%% The following are 2 ways to extend a vector one element at a time

% numvec = [];
% inputnum=input('Enter a positive number: ');
% while inputnum >= 0
%     numvec = [numvec inputnum];
%     inputnum = input('Enter a positive number: ');
% end

% % OR:

% i = 0;
% inputnum=input('Enter a positive number: ');
% while inputnum >= 0
%     i=i + 1;
%     numvec(i) = inputnum;
%     inputnum = input('Enter a positive number: ');
% end