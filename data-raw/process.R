# library(dplyr)
#
# # Transform "hitter" to CIlist0 ====== ========
#
# hitter <- dplyr::mutate(hitter, # polar-ify, translate
#   r = sqrt( (px + 2)^2 + (pz - 3.5)^2),
#   theta = atan2(pz - 3.5, px + 2))
#
# # hitzone <- cbind(expand.grid(px = seq(-1.5, 1.5, length = 50),
# #                              pz = seq(1, 4, length = 70))) %>%
# #   mutate(r = sqrt( (px + 2)^2 + (pz - 3.5)^2),
# #          theta = atan2(pz - 3.5, px + 2)) # for plotting
#
# mod.polar <- glm(hit ~ r*theta + I(r^2)*I(theta^2), # fit model
#                  family = binomial, data = hitter)
#
# preds <- predict(mod.polar, newdata = hitzone, se.fit = TRUE)
#   # predictions; logit scale; use "type = "response" for p
#
# inv_logit <- function(x){exp(x)/(1+exp(x))} # inv. logit fcn
#
# hitzone <- with(preds, mutate(hitzone, logit = fit, SE_logit = se.fit, phat = inv_logit(logit))) # for plotting
#
# CI_list <- list(hitzone = dplyr::select( # create mega-list
#   hitzone, px, pz, logit, SE_logit, phat)) # add first element
#
# # Example: CI_list[[1]][1,1]
#
# # Transform "CIlist0" to "CI_list" (mega-list) =========
#
# p_CI_lower <- function(pct, logit, SE_logit){
#   upper <- logit - qnorm((1 - pct/100)/2, lower.tail = FALSE)*SE_logit
#   inv_logit(upper)
# } # lower bound
# p_CI_upper <- function(pct, logit, SE_logit){
#   upper <- logit + qnorm((1 - pct/100)/2, lower.tail = FALSE)*SE_logit
#   inv_logit(upper)
# } # upper bound
#
# CI_builder <- function(containerList){ # CI mega-list Builder
#   pct <- seq(1, 99, by = 1) # percentiles
#   for(i in 1:length(pct)){
#     percent <- pct[i]         # For CI widths
#     containerList[[i+1]] <- with(containerList[[1]], # use 1st element
#         # Create "(lb, ub)_2xn" df as list elements
#         data.frame(lb = p_CI_lower(percent, logit, SE_logit),
#                    ub = p_CI_upper(percent, logit, SE_logit)
#                                  )
#     )
#   }
#   return(containerList)
# } # mega-list builder
#
#
#
