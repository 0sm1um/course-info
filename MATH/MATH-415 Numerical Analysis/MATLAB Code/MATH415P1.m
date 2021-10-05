%% Project 1

%% The Gram Schmidt Method
%B)
Xb = [1,1,1;0,1,1;0,0,1];
%C)
Xc = [1,1,1;1,1,0;;1,0,0];
%D)
Xd = [2,-1,0;0,-1,2;-1,0,0;-1,2,-1];
Qb=gramSchmidt(Xb)
Qc=gramSchmidt(Xc)
Qd=gramSchmidt(Xd)
Qd*Qd'
%e) It is not surprising that Xd is not a orthogonal matrix, this algorithm
%cannot produce an orthogonal matrix of dimension 4x4(as would be required
%of vectors of dimension 4) when only a set of 3 vectors are supplied.

%% QR factorization by the Gram Schmidt method

%b)
[Qa,Ra]=gs_factor(Xc);
Qa*Ra
Xc
%Looks good to me chief!

%C)
A = rand(100,100);
[Qc,Rc] = gs_factor(A);
A;
norm(Qc'*Qc - eye(100))
norm(Qc*Qc' - eye(100))


%% QR decompositon by Householder Reflections

[Qb,Rb] = qr(Xc);

[Qc,Rc] = gs_factor(A);
A;
norm(Qc'*Qc - eye(100))
norm(Qc*Qc' - eye(100))
%Everything checks out!

%{
%% Solve systems of linear equations the QR way

n=7;
A = magic(n);
x = [1:n]';
b = A * x;
x2 = qr_solve(A,b);
norm(x-x2)
%As we can see, the solver works.

%% Singular Value Decomposition

imEin = double(imread('C:\Users\echo4\Downloads\Einstein_tongue.jpg'));
colormap(gray(256));
image(imEin)
daspect([1,1,1])
[U,S,V] = svd(imEin);
plot(diag(S));
im50 = U(:,1:50)*S(1:50,1:50)*V(:,1:50)';
im25 = U(:,1:25)*S(1:25,1:25)*V(:,1:25)';
im10 = U(:,1:10)*S(1:10,1:10)*V(:,1:10)';
image(im50)
%image(im25)
%image(im10)

%% Excercise 7
imE = double(rgb2gray(imread('C:\Users\echo4\Downloads\EinsteinTeaching.jpg')));
colormap(gray(256));
%R = imE(:,:,1);
%G = imE(:,:,2);
%B = imE(:,:,3);
[U,S,V] = svd(imE);
%[UR,SR,VR] = svd(R);[UG,SG,VG] = svd(G);[UB,SB,VB] = svd(B);
%im50R = UR(:,1:50)*SR(1:50,1:50)*VR(:,1:50)';
%im50G = UG(:,1:50)*SG(1:50,1:50)*VG(:,1:50)';
%im50B = UB(:,1:50)*SB(1:50,1:50)*VB(:,1:50)';
%im50(:,:,1)=im50R; im50(:,:,2)=im50G; im50(:,:,3) = im50B;
im50 = U(:,1:50)*S(1:50,1:50)*V(:,1:50)';
image(im50)

%}
%}