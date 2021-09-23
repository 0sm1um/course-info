install.packages("lpSolve") # Once per machine
library("lpSolve")

f_c1 <- c(1,-3)
f_A1 <- matrix( c(-1, 2,
                  1, 1),
                nrow = 2,
                byrow = TRUE )

f_b1 <- c(6, 5)
f_q1 <- c("<=","<=")

lpSolve::lp("min", f_c1, f_A1, f_q1, f_b1)

lp1 <- lpSolve::lp("min", f_c1, f_A1, f_q1, f_b1)

#McDonalds Problem

f_c1 <- c(1.39,1.99,1,3.79)
f_A1 <- matrix( c(-220, -170, -300, -379,
                  10, 10, 14, 20,
                  180,330,745,582),
                nrow = 3,
                byrow = TRUE )

f_b1 <- c(-1000, 46, 2300)
f_q1 <- c("<=","<=", "<=")

lpSolve::lp("min", f_c1, f_A1, f_q1, f_b1)

lp2 <- lpSolve::lp("min", f_c1, f_A1, f_q1, f_b1)
lp2$solution
