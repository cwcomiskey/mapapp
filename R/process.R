
# Convert to polar, tranlate origin
hitter <- mutate(hitter,
  r = sqrt( (px + 2)^2 + (pz - 3.5)^2),
  theta = atan2(pz - 3.5, px + 2))

mod.polar <- glm(hit ~ r*theta + I(r^2)*I(theta^2),
                 family = binomial, data = hitter)



# Points for plotting  ====
hitzone <- cbind(expand.grid(px = seq(-1.5, 1.5, length = 50),
                             pz = seq(1, 4, length = 70))) %>%
  mutate(r = sqrt( (px + 2)^2 + (pz - 3.5)^2),
         theta = atan2(pz - 3.5, px + 2))

preds <- predict(mod.polar, newdata = hitzone, se.fit = TRUE)
                 #  logit scale; use "type = "response" for p

inv_logit <- function(x){exp(x)/(1+exp(x))}
hitzone <- with(preds,
                mutate(hitzone,
                       logit = fit,
                       SE_logit = se.fit,
                       phat = inv_logit(logit)
                       )
                )

# Functions, and the rest ======

p_CI_lower <- function(pct, logit, SE_logit){
  upper <- logit - qnorm((1 - pct/100)/2, lower.tail = FALSE)*SE_logit
  inv_logit(upper)
}
p_CI_upper <- function(pct, logit, SE_logit){
  upper <- logit + qnorm((1 - pct/100)/2, lower.tail = FALSE)*SE_logit
  inv_logit(upper)
}
