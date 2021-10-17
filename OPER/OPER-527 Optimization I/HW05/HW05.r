library("lpSolve")
#Refinery Problem

f_c1 <- c(1,
          1,
          1,
          1,
          1,
          1,
          1,
          1,
          1,
          1,
          1,
          1,
          1,
          1,
          1,
          1,
          1,
          1,
          1,
          1,
          1,
          1,
          1,
          1)

f_A1 <- matrix( c(1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
                  0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,
                  0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,0,0,0,0,0,0,
                  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,1,
                  523,0,0,0,0,0,721,0,0,0,0,0,639,0,0,0,0,0,0,0,0,0,0,0,
                  0,419,0,0,0,0,0,615,0,0,0,0,0,492,0,0,0,0,0,0,0,0,0,0,
                  0,0,563,0,0,0,0,0,709,0,0,0,0,0,513,0,0,0,0,0,0,0,0,0,
                  0,0,0,315,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,330,0,0,
                  0,0,0,0,292,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,407,0,
                  0,0,0,0,0,312,0,0,0,0,0,314,0,0,0,0,0,309,0,0,0,0,0,291
                ),
nrow = 10,
byrow = TRUE )

f_b1 <- c(24,
          24,
          24,
          24,
          21000,
          5000,
          2000,
          1200,
          1400,
          4300)


f_q1 <- c("<=",
          "<=",
          "<=",
          "<=",
          ">=",
          ">=",
          ">=",
          ">=",
          ">=",
          ">=")


lpSolve::lp("min", f_c1, f_A1, f_q1, f_b1)

lp2 <- lpSolve::lp("min", f_c1, f_A1, f_q1, f_b1)
lp2$solution
