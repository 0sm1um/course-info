function [xn,k,error] = steepestAscent(f,xi,h,tol);                        
  %Note: Input must be in a function handle. "@(x) x^2..." format.
  %Variables must be in x_n format
  syms x1 x2 x3 x4 x5 x6 x7 x8 x9
  vars = [x1 x2 x3 x4 x5 x6 x7 x8 x9];
  g=sym(f);
  ndim = length(xi);
  if ndim != length(h) != length(tol)
      disp['Dimensions for h and xi do not match.']
  end
  grad = cell(ndim,1);
  for i=[1:ndim]
      grad{ndim,1} = [matlabFunction(gradient(g,vars(i)))];
  end
  x=xi;                         %Initialize x
  error=abs(f(x))+1;            %Initialize error
  k=0;                          %Initialize k
  xn=zeros(ndim,1);
 error = [error];
 while error(end)>tol
    k=k+1;                    %Step
    for i = [1:ndim]
        xn(i,:) = x+h.*sign(grad{i,1});
        error(end)=abs(f(xn)-f(x));
        x=xn;
        if length(error(i,:)) == length(unique(error(i,:)))
            h(i) = h(i)/2;
            disp(['Step Size Halved on row',num2str(i)])
        end
 end
%error = error(end);
disp(['Operation completed in ', num2str(k), ' iterations.'])
end