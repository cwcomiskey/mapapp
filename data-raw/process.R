library(dplyr)

hitter <- dplyr::mutate(hitter,
  r = sqrt( (px + 2)^2 + (pz - 3.5)^2),
  theta = atan2(pz - 3.5, px + 2))

hitzone <- cbind(expand.grid(px = seq(-1.5, 1.5, length = 50),
                             pz = seq(1, 4, length = 70))) %>%
  mutate(r = sqrt( (px + 2)^2 + (pz - 3.5)^2),
         theta = atan2(pz - 3.5, px + 2))

mod.polar <- glm(hit ~ r*theta + I(r^2)*I(theta^2),
                 family = binomial, data = hitter)

preds <- predict(mod.polar, newdata = hitzone, se.fit = TRUE)
                 #  logit scale; use "type = "response" for p

inv_logit <- function(x){exp(x)/(1+exp(x))}

hitzone <- with( preds, mutate(hitzone, logit = fit, SE_logit = se.fit, phat = inv_logit(logit)))

CI_list <- list(hitzone = dplyr::select(
  hitzone, px, pz, logit, SE_logit, phat)) # first list element of big kahuna you build

# Example: CI_list[[1]][1,1]

