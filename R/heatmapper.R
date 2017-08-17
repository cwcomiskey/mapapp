#' Create a Simple Heat Map (by ggplot)
#'
#' This function creates a basic heat map with ggplot(), for default use in shinyit().
#' @param dataset Data frame to use to build heat map. Coordinates for the heat map must be columns in \code{dataset} named \code{x} and \code{y}
#' @param colors The statistic of interest represented by a color at each (\code{x}, \code{y}) location on the heat map; must be saved in global environment, or supplied in this format: dataset$colors
#' @param plot_title The title for the plot, must be in quotes, defaults to "Heat Map"
#' @param guide_title The title for the guide, must be in quotes, defaults to "Stat"
#' @param lower lower bound for plot legend
#' @param upper upper bound for plot legend
#' @return A heat map of the statistic supplied to the argument \code{colors}.
#' @export
#' @examples
#' with(FinalList[[1]], heatmapper(FinalList[[1]], colors = stat))

heatmapper <- function(dataset, colors,
                    plot_title = "Heat Map",
                    guide_title = "Stat",
                    lower = 0, upper = 0.17){
ggplot2::ggplot(ggplot2::aes(x, y), data = dataset) +
    ggplot2::geom_tile(ggplot2::aes(fill = colors)) +
    ggplot2::coord_equal() +
    ggplot2::scale_fill_distiller(palette = "YlOrRd",
                       trans = "reverse",
                       name = guide_title,
                       limits = c(0.17, 0)) +
    ggplot2::labs(title = plot_title) +
    ggplot2::theme(plot.title = ggplot2::element_text(hjust = 0.5))
}
# Usage: with(megalist[[i+1]], mapify(mega-list[[1]], fill))
# Note: "fill" from megalist[[i+1]]
