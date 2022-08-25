
theta1 <- function(x1){
  res1 <- 13+0.3*x1+
    3*exp(-abs(x1-3)*3) +
    4*exp(-abs(x1-4)*3) +
    5*exp(-abs(x1-5)*3) +
    16*exp(-abs(x1-6)*3) +
    7*exp(-abs(x1-7)*3) +
    8*exp(-abs(x1-8)*3) +
    9*exp(-abs(x1-9)*3) +
    - 0.02*x1^2
  return (res1)  
}

x1 <- seq(0,20,by = 0.01)
y1 <- theta1(x1)
plot(x1,y1,type="l")

x0 <- 2
points(x0,0)
count1=0

out1 <- matrix(0,nrow = 1000,ncol = 2)

temp1 <- 10
for (i in 1:1000){
  x1 <- x0+rnorm(1,0,0.9)
  points(x1,0,col="red")
  diff1 <- theta1(x1) - theta1(x0)
  out1[i,1] <- x1
  out1[i,2] <- theta1(x1)
  nrg1 <- exp(diff1/temp1)
  U1 <- runif(1,0,1)
  if (nrg1 > U1) {
    x0 <- x1
    points(x0,0,col="blue")
    segments(x0,0,x0,theta1(x0),col="blue")
    count1=count1+1
    temp1 <- max(temp1 - 0.01, 0.01)
  }
}

maxloc <- which(out1[,2] == max(out1[,2]))
out1[maxloc,]

#Leave oscillation to you