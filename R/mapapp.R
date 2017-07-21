#' Which is it going to be?
#'    (1) fcn(data) ---> Shiny app
#'    (2) fcn(data x 99) ---> Shiny app
#'    (3) fcn(99 maps) ---> Shiny app


# Point estimate heat map
hmci <- function(dataset, stat){
ggplot(aes(px, pz), data = dataset) +
  geom_tile(data = dataset, aes(fill = stat)) +
  coord_equal() +
  sz_fcn() + # sz_fcn{varyres}
  spec_fcn(g = FALSE) # # spec_fcn{varyres}
}

# Confidence Intervals ==================================

CI_list <- list(hitzone = select(
  hitzone, px, pz, logit, SE_logit, phat)) # first list element
  # domain, \hat{logit}, SE(logit), \hat{p} ()

pct <- seq(1, 99, by = 1) # percentiles

# Example: CI_list[[1]][1,1]

for(i in 1:length(pct)){
  percent <- pct[i] # For CI widths
  CI_list[[i+1]] <- with(CI_list[[1]],
                         data.frame(plb = p_CI_lower(percent, logit, SE_logit),
                                    pub = p_CI_upper(percent, logit, SE_logit)
                                    ))} # Everything container!


shiny_hmci_fcn <- function(dataset, bound){
ggplot(aes(px, pz), data = dataset) +
  geom_tile(data = test, aes(fill = bound)) +
  coord_equal() +
  sz_fcn() + # sz_fcn{varyres}
  spec_fcn(g = FALSE) # # spec_fcn{varyres}
} # Be sure to use: with(dataset, shiny_hmci_fcn(...))

test <- cbind.data.frame(CI_list[[1]], CI_list[[10]]) # Create DF: pts, bnds
with(test, shiny_hmci_fcn(dataset = test, plb))

runApp("R")
