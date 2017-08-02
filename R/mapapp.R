library(ggplot2)

# hmci <- function(dataset, stat){
#   ggplot(aes(x, y), data = dataset) +
#   geom_tile(data = dataset, aes(fill = stat)) +
#   coord_equal() + sz_fcn() + spec_fcn(g = FALSE)
# } # Point estimate heat map

shiny_hmci_fcn <- function(dataset, bound){
ggplot(aes(px, pz), data = dataset) +
  geom_tile(data = dataset, aes(fill = bound)) +
  coord_equal() +
  sz_fcn() + # sz_fcn{varyres}
  spec_fcn(g = FALSE) # # spec_fcn{varyres}
}
# Usage: with(megalist[[i+1]], shiny_hmci_fcn(mega-list[[1]], fill))
# "fill" from megalist[[i+1]]

