function x = qr_solve(A,b)
% x = qr solve (A,b)
%This function accepts an matrix A and vector b as an argument, then
%performs QRdecomposition on it, and then solves the linear system for a 
% Ax = b
%John Hiles10-5-2020
[Q,R] = qr(A);
b = Q'*b
[m,n] = size(R)
for i = n:(-1):1                        %Find solution of Upper Triangular
        factor = 0;
        for k = (i + 1):1:n
            factor = factor + R(i,k)*x(k);
        end
        x(i) = (b(i) - factor)/R(i, i);
end
x = x'                                  %Convert to proper column format.
end