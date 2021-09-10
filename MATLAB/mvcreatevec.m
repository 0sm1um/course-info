function outvec=createvec(mymin,mymax)
% Creates a vector that iterates from a specificed minimum to maximum

% If the input "mymin" isn't smaller than "mymax", exchange the values
% using a temporary variable.
if mymin>mymax
    temp=mymin;
    mymin=temp;
    mymax=temp;
end

outvec=mymin:mymax
end
