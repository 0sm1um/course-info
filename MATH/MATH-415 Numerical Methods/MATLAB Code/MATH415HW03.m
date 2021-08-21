% HW04
%{
%% Q5.2
T = [];
for n = 3:200
M=magic(n);
Ti=cputime;
d=det(M);
T=[T,(cputime-Ti)];
end
c4= polyfit(3:200,T,4)
%Note, because the coefficiant for the highest order term of the fourth order
%polynomial is so small(almost too small to represent), we can assume that 
%our actual polynomial fit is third order.


%% Q5.3
%To approach this problem, I wrote an LU Factorization function, and I am
%using cells to calculate the LU factorization from -20 to 20. This first
%loop is to calculate our respective matrix and solution vectors. The
%second is to calculate the LU factorization itself.
sub2A = {}; b = {};
for i = [-20:20]
    sub2A{i+21} = [1,1-i,3;2,2,2;3,6,4];
    b{i+21} = [5-i;6;13;];
end
soln = {}
for i = [-20:20]
    soln{i+21} = LUSolve(sub2A{i+21}, b{i+21});
end
%As you can see, all values produce the same solution <1,1,1> except the
%value of epsilon = 0 and epsilon = -6. The book tells us, that for
%epsilon=0, the second submatrix is singular. Thus meaning no LU
%factorization exists for epsilon = 0.
%The second submatrix for the epsilon=6 is given as follows
i = 6;
    sub2A = [1,1-i;2,2]
    det(sub2A)
    
    [L,U] = lu([1,1-i,3;2,2,2;3,6,4]);
%The submatrix for i=2 is nonzero, and thus the LU decomposition is 
%possible, even if my algorithm failed presumably due to roundoff error.
%The factorization is still attainable with the built in MATLAB LU
%factorization function.



%% Q5.5
%Let A be the following 3x3 matrix:
A5 = [1,0,5;2,1,6;3,4,0];
%Observe here, the canonical basis vectors of the Rn
e1 = [1;0;0]; e2 = [0;1;0]; e3 = [0;0;1];
%The solution vector x to the matrix equation "A*xn = en" yields
%corresponding vectors xn which satisfy the equation
%A*[x1,x2,x3]=[x1,x2,x3]*A which by definition is the inverse.
x1=A5\x1; x2=A5\x2; x3=A5\x3;
%See here, that the results of this computation match the "true" version
%obtained via the built in MATLAB function.
inv(A5)
A5inv2 = [x1,x2,x3]
%So it is a simple matter of using solving for the x1, x2, and x3 vectors
%which LU decomposition is perfectly suited for. Note, that for an nxn
%matrix, the equation must be solved n times for n "en" basis vectors.


%% Q 5.8
%First lets symbolically compute the LU factorization.
L = {};U = {};
syms i
[L,U] = lu([2,-2,0;i-2,2,0;0,-1,3]); L; U;
%The above factorization yields the following lower and upper triangular
%matricies in the following format:
%L = [1,0,0;(e-2/)2,1,0;0,-1/e,1];
%U = [2,-2,0;0,e,0;0,0,3];
e=1;xex=ones(3,1);err=[];
for i=1:10
b=[0;e;2]; L = [1,0,0;(e-2/2),1,0;0,-1/e,1];U=[2,-2,0;0,e,0;0,0,3];
y=L\b;x=U\y; err(i)=norm(x-xex)/norm(xex); e=e *0.1;
end
%As can be seen from this vector err, the error remains constant as e is
%decreased by a factor of 10 each iteration. Now to test for alternate
%values of epsilon
e=1/3; xex=[log(5/2);1;1]'; err2=[];
for k=1:100
b=[2*log(5/2)-2,(e-2)*log(5/2)+2,2]';L=[1,0,0;(e-2/2),1,0;0,-1/e,1];
U=[2,-2,0;0,e,0;0,0,3];y=L\b;x=U\y;err2(k)=norm(x-xex)/norm(xex); e=e *0.1;
end
%Error remains roughly constant until k = 12, where error very rapidly
%increases. I suspect this indicates that k=12 is where e begins to become
%too small for MATLAB to represent accuratley,


%% Q5.9

%First, lets find the values of the b vectors from 1 to 10.
A = [15,6,8,11;6,6,5,3;8,5,7,6;11,3,6,9]
b = {}
for i = 1:10
b{i} = A^i*[1;1;1;1]
end
%Now with our b vectors, lets use LU factorization to solve for our x
%vectors.
x={}
for i = 1:10
x{i} = LUSolve(A^i,b{i})
end
%We can see, that the solved solutions degenerate at i=4, presumably due to
%how massive the elements of A become with high values of i.

%}
%% Q5.10
%If (lambda, v) are an eigenvalue-eigenvector pair of a matrix A, then
%lambda^2 is an eigenvalue of A^2 with the same eigenvector.
A = [1,0,5;2,1,6;3,4,0];
[V,D] = eig(A);
lambda = D(1,1);
v = V(:,1);
%From Av = ?v it follows A2v = ?Av = ?2v. The computation is shown
%below:
lambda^2*v
A^2*v
%Consequently, if A is symmetric and positive, K(A2)=(K(A))2.