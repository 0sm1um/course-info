#Problem 1
curve((sin(x)+1)*exp(10*x-x^2-25),0,10,100)

#Problem 2b
curve(-x^5+54*x^3-40*x^2-25*x,-10,10,100)

#Problem 3b
xdata <- seq(from=0,to=10,by=100)
y1 <- function(x) {(exp(-x^2+10*x-25)*(cos(x)-2*(x-5)*(sin(x)-1)))}
y2 <- function(x) {-(4*(x-5)*cos(x)-(4*x^2-40*x+97)*sin(x)+2*(2*x^2-20*x+49))*exp(-x^2+10*x-25)}

curve(y2, from=0, to=10,col=3)
curve(y1, from=0, to=10,col=2, add=TRUE)

