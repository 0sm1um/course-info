library("lpSolve")
#Best Buy TV Buying Program

f_c1 <- c(12,
          10,
          20,
          50,
          70,
          80,
          200)

f_A1 <- matrix(c(
  
  
  
  
                  ),
                nrow = 10,byrow = TRUE )

f_b1 <- c(0.8*12,
          0.8*14,
          0.8*19,
          0.8*30,
          0.8*30,
          0.8*7,
          0.8*3,
          92,
          200000,
          16000)


f_q1 <- c(">=",
          ">=",
          ">=",
          ">=",
          ">=",
          ">=",
          ">=",
          ">=",
          "<=",
          "<=")


lpSolve::lp("max", f_c1, f_A1, f_q1, f_b1)

lp2 <- lpSolve::lp("max", f_c1, f_A1, f_q1, f_b1)
lp2$solution

intlp2 <- lpSolve::lp("max", f_c1, f_A1, f_q1, f_b1, int.vec=1:7)
intlp2$solution
