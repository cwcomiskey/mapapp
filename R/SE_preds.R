set.seed(500)
dat <- data.frame(x = runif(20), y = rbinom(20, 1, .5))
o <- glm(y ~ x, data = dat)
pred <- predict(o, newdata = data.frame(x=1.5), se.fit = TRUE)

# To obtain a prediction for x=1.5 I'm really
# asking for yhat = b0 + 1.5*b1 so my
# C = c(1, 1.5)
# and vcov applied to the glm object gives me
# the covariance matrix for the estimates
C <- c(1, 1.5)
std.er <- sqrt(t(C) %*% vcov(o) %*% C)

pred$se.fit # [1] 0.4246289
std.er # [1,] 0.4246289