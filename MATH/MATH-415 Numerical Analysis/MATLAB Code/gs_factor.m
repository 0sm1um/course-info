function [Q,R] = gs_factor(X)
%Q = gramSchmidt(X)
%Accepts matrix X as argument, returns orthogonal matrix Q and upper
%triangular matrix R which when multiplied together equal the inputted
%Matrix.
%John Hiles 10-4-2020
[m,n] = size(X);
Q = [];
R = [];
nq = 0;
for j = 1:n
    v = X(:,j);
    for i = 1:j-1
        R(i,j) = Q(:,i)'*X(:,j);
        X(:,j) = X(:,j)-R(i,j)*Q(:,i);
    end
    R(j,j) = norm(X(:,j));
    if R(j,j) > eps*max(max(R))
        nq = nq + 1;
        Q = [Q,X(:,j)/R(j,j)];
    end
end
end
