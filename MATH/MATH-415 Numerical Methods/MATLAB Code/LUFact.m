function output = LUFact(A,b)
%Accepts Matrix A, vector b and number of iterations n.
flops = 0;
n = size(A,1);
for k = 1:n-1 %Loop through pivots
    for i = k+1:n %Loop through rows, below pivot
        factor = A(i,k) / A(k,k); %Zero out leading 
        flops = flops + 1;
        A(i,k) = factor;
        for j = k+1:n
            A(i,j) = A(i,j) - factor * A(k,j);
            flops = flops+ 2;
        end
        b(i,1) = b(i,1) - factor*b(k,1);
    end
end
output = {A, b, flops};
end