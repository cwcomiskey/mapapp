hmci <- function(dataset, filler = stat1){
  ggplot(aes(x, y), data = dataset) +
  geom_tile(data = dataset, aes(fill = filler)) +
  coord_equal() + sz_fcn() + spec_fcn(g = FALSE)
}

hmci(CIlist0$df0, filler = stat1)
with(CIlist0$df0, hmci(CIlist0$df0, stat1))

library(help = "datasets")

CImagine <- function(containerList){ # Imaginary mega-list Builder
  for(i in 1:99){
    containerList[[i+1]] <- data.frame(plb = runif(3500, 0, 0.15),
                                       pub = runif(3500, 0, 0.15))
  }
  return(containerList)
}
