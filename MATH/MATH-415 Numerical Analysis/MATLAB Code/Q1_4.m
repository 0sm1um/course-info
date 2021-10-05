
I = 2 * eye(10);
for i = [2:10];
    I(i,i-1) = -3;
end
I = I'