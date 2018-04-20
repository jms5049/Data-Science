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

#k means clustering
kc <- kmeans(z,2)

str(kc)
kc$centers
kc$cluster

plot(z, col = kc$cluster, xlab = "x1" , ylab ="x2")
points(kc$centers, col = 1:3, pch = 8, cex=2)
