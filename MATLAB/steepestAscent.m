function [xn,k,error] = steepestAscent(f,xi,h,tol);                        
  %Note: Input must be in a function handle. "@(x) x^2..." format
  g=sym(f);
  g=diff(g);
  fprime=matlabFunction(g);     %Compute f'
  x=xi;                         %Initialize x
  error=abs(x)+1;               %Initialize error
  k=0;                          %Initialize k
  xn=[];
 error = [error];
 while error(end)>tol
    k=k+1;                    %Step
    xn = x+h*sign(fprime(x));
    error(end)=abs(xn-x);
    x=xn;
    if length(error) == length(unique(error))
        h = h/2;
        fprintf('Step Size halved\n')
    end
 end
error = error(end);
disp(['Operation completed in ', num2str(k), ' iterations.'])
end