library("lpSolve")
#Production Problem

f_c1 <- c(as.numeric(375),
          as.numeric(1987/2),
          as.numeric(159),
          as.numeric(450),
          as.numeric(0),
          as.numeric(212),
          as.numeric(0),
          as.numeric(13909/4),
          as.numeric(212),
          as.numeric(1875/2),
          as.numeric(0),
          as.numeric(106)
          )

f_A1 <- matrix( c(1,1,1,0,0,0,0,0,0,0,0,0,
                  0,0,0,1,1,1,0,0,0,0,0,0,
                  0,0,0,0,0,0,1,1,1,0,0,0,
                  0,0,0,0,0,0,0,0,0,1,1,1,
                  100,0,0,120,0,0,0,0,0,250,0,0,
                  0,50,0,0,0,0,0,175,0,0,0,0,
                  0,0,75,0,0,100,0,0,100,0,0,50
                  ),
                nrow = 7,
                byrow = TRUE )

f_b1 <- c(24,
          24,
          24,
          24,
          2500,
          1200,
          4500)

f_q1 <- c("<=",
          "<=",
          "<=",
          "<=",
          ">=",
          ">=",
          ">=")


lpSolve::lp("max", f_c1, f_A1, f_q1, f_b1)

lp2 <- lpSolve::lp("max", f_c1, f_A1, f_q1, f_b1)
lp2$solution
