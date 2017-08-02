hmci <- function(dataset, filler = stat1){
  ggplot(aes(x, y), data = dataset) +
  geom_tile(data = dataset, aes(fill = filler)) +
  coord_equal() + sz_fcn() + spec_fcn(g = FALSE)
}

hmci(CIlist0$df0, filler = stat1)
with(CIlist0$df0, hmci(CIlist0$df0, stat1))

library(help = "datasets")

