#first matrix a
a1 <- matrix(rnorm(50, 2, 1), nrow = 50, ncol = 1, byrow = TRUE)
a2 <- matrix(rnorm(50, -2, 1), nrow = 50, ncol = 1, byrow = TRUE)

#second matrix b
b3 <- matrix(rnorm(50, 2, 1), nrow = 50, ncol = 1, byrow = TRUE)
b4 <- matrix(rnorm(50, -2, 1), nrow = 50, ncol = 1, byrow = TRUE)

#bind matrices a , b
x1 <- rbind(a1,a2)
x2 <- rbind(b3,b4)

#visualize
plot(x1,x2)

#result matrix
z <- cbind(x1,x2)
