function x = LUSolve(A, b)
%This function accepts a square matrix A, and a vector b as arguments. And
%it computes the LU Decomposition of that system of linear equations.

    if size(A,1) ~= size(A,2) %Error message for non square matricies
        x = NaN;
        fprintf('\nError: Matrix is not square\n')
        return
    end
    n = length(b);
    x = zeros(n,1);
    y = zeros(n,1);
    flops = 0;
    % decomposition of matrix, Doolittle’s Method
    for i = 1:1:n
        for j = 1:1:(i - 1)
            factor = A(i,j);
            for k = 1:1:(j - 1)
                factor = factor - A(i,k)*A(k,j);
                flops = flops + 2;
            end
            A(i,j) = factor/A(j,j);
            flops = flops + 1;
        end
        for j = i:1:n
            factor = A(i,j);
            for k = 1:1:(i - 1)
                factor = factor - A(i,k)*A(k,j);
                flops = flops + 2;
            end
            A(i,j) = factor;
        end
    end
    %A = L+U-I
    % find solution of Ly = b
    for i = 1:1:n
        factor = 0;
        for k = 1:1:i
            factor = factor + A(i,k)*y(k);
            flops = flops + 2;
        end
        y(i) = b(i) - factor;
        flops = flops + 1;
    end
    % find solution of Ux = y
    for i = n:(-1):1
        factor = 0;
        for k = (i + 1):1:n
            factor = factor + A(i,k)*x(k);
            flops = flops + 2;
        end
        x(i) = (y(i) - factor)/A(i, i);
        flops = flops + 2;
    end
    fprintf('Solution computed with %f flops\n', flops)
end