library(ggplot2)

#' @export
shiny_hmci_fcn <- function(dataset, bound){
ggplot(aes(x, y), data = dataset) +
  geom_tile(data = dataset, aes(fill = bound)) +
  coord_equal() +
  sz_fcn() + # sz_fcn{varyres}
  spec_fcn(g = FALSE) # spec_fcn{varyres}
}
# Usage: with(megalist[[i+1]], shiny_hmci_fcn(mega-list[[1]], fill))
# Note: "fill" from megalist[[i+1]]

#' @export
heatmapit <- function(){
    appDir <- system.file("shiny-mapapp", package = "mapapp")
    if (appDir == "") {
      stop("Could not find Shiny (map)app directory.
           Try re-installing `mapapp`.", call. = FALSE)
    }
    shiny::runApp(appDir, display.mode = "normal")
}

