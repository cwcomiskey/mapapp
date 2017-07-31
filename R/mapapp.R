library(ggplot2)

# Point estimate heat map
hmci <- function(dataset, stat){
  ggplot(aes(px, pz), data = dataset) +
  geom_tile(data = dataset, aes(fill = stat)) +
  coord_equal() + sz_fcn() + spec_fcn(g = FALSE)
}

inv_logit <- function(x){exp(x)/(1+exp(x))}

p_CI_lower <- function(pct, logit, SE_logit){
  upper <- logit - qnorm((1 - pct/100)/2, lower.tail = FALSE)*SE_logit
  inv_logit(upper)
}
p_CI_upper <- function(pct, logit, SE_logit){
  upper <- logit + qnorm((1 - pct/100)/2, lower.tail = FALSE)*SE_logit
  inv_logit(upper)
}

CI_builder <- function(containerList){ # CI List Builder
  pct <- seq(1, 99, by = 1) # percentiles
  for(i in 1:length(pct)){
    percent <- pct[i]         # For CI widths
    containerList[[i+1]] <- with(containerList[[1]],
                                 data.frame(plb = p_CI_lower(percent, logit, SE_logit),
                                            pub = p_CI_upper(percent, logit, SE_logit)
    )
    )
  }
return(containerList)
  }

shiny_hmci_fcn <- function(dataset, bound){
ggplot(aes(px, pz), data = dataset) +
  geom_tile(data = dataset, aes(fill = bound)) +
  coord_equal() +
  sz_fcn() + # sz_fcn{varyres}
  spec_fcn(g = FALSE) # # spec_fcn{varyres}
} # Be sure to use: with(dataset, shiny_hmci_fcn(...))

# test <- cbind.data.frame(CI_list[[1]], CI_list[[10]]) # Create DF: pts, bnds
# with(test, shiny_hmci_fcn(dataset = test, plb))
