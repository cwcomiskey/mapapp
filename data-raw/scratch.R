
# library(help = "datasets")

CImagine <- function(containerList){ # Imaginary mega-list Builder
  for(i in 1:99){
    containerList[[i+1]] <- data.frame(plb = runif(3500, 0, 0.15),
                                       pub = runif(3500, 0, 0.15))
  }
  return(containerList)
}
