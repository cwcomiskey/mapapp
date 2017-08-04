#' Create a Simple Heat Map (by ggplot)
#'
#' This function creates a basic heat map with ggplot(), for default use in shinyit().
#'
#' @param dataset Data frame to use to build heat map. Coordinates for the heat map must be columns in \code{dataset} named \code{x} and \code{y}
#' @param stat The statistic of interest represented by a color at each (\code{x}, \code{y}) location
#'
#' @return A heat map, representing \code{stat} with a color at each (\code{x}, \code{y}) location.
#' @export
#' @examples
#' d0 <- data(CIdata0)
#' d1 <- as.data.frame(d0)
#' mapify(d1)


mapify <- function(dataset, stat){
ggplot(aes(x, y), data = dataset) +
  geom_tile(aes(fill = stat)) +
  coord_equal() +
  scale_fill_distiller(palette = "Spectral")
}
# Usage: with(megalist[[i+1]], shiny_hmci_fcn(mega-list[[1]], fill))
# Note: "fill" from megalist[[i+1]]


