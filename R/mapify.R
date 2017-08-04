#' Create a Simple Heat Map (by ggplot)
#'
#' This function creates a basic heat map with ggplot(), for default use in shinyit().
#' @param dataset Data frame to use to build heat map. Coordinates for the heat map must be columns in \code{dataset} named \code{x} and \code{y}
#' @param colors The statistic of interest represented by a color at each (\code{x}, \code{y}) location on the heat map
#' @return A heat map of the statistic supplied to the argument \code{colors}.
#' @export
#' @examples
#' d0 <- data(CIdata0)
#' d1 <- as.data.frame(d0)
#' mapify(d1)

mapify <- function(dataset, colors){
ggplot(aes(x, y), data = dataset) +
  geom_tile(aes(fill = colors)) +
  coord_equal() +
  scale_fill_distiller(palette = "Spectral")
}
# Usage: with(megalist[[i+1]], mapify(mega-list[[1]], fill))
# Note: "fill" from megalist[[i+1]]
