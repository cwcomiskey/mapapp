library(ggplot2)

mapit <- function(ABCE = ABCE) {
  ggplot2::ggplot(ABCE, aes(x = x, y = y)) +
  ggplot2::geom_tile(data = ABCE, aes(fill = statistic),
                     width = ABCE$width, height = ABCE$height) +
  coord_equal()
} # Plane Jane

spec_fcn <- function(g = TRUE){
  list(scale_fill_distiller(palette = "Spectral",
                            limits = c(0, 0.167),
                guide = if(g)
                guide_legend(title = expression(hat(p)[GLM]))
                else guide = FALSE)
       )
} # Spectral

text_fcn <- function(s = 8){
  list(geom_text(aes(label = count), size = s))
} # Print counts

lab_fcn <- function(s1 = 25, s2 = 30){
  list(
    labs(title = "Peralta Variable-Resolution \n Empirical Success Probability",
         # subtitle = "Johny Peralta",
         x = "Feet from \n Middle of Home Plate",
         y = "Feet Off Ground"),
    theme(legend.key.size = unit(2, "cm"),
          legend.text = element_text(size = s2),
          legend.title = element_text(size = s2),
          legend.title.align = 0.25,
          axis.title.x = element_text(size=s1),
          axis.title.y = element_text(size=s1),
          title = element_text(size = s2),
          plot.title = element_text(hjust = 0.5),
          plot.subtitle = element_text(hjust = 0.5),
          axis.text = element_text(size = s1))
  )
} # Labels

sz_fcn <- function(width = 1.5){
  kzone <- data.frame(x = c(-0.75, -0.75, 0.75, 0.75, -0.75),
                      y = c(1.5, 3.5, 3.5, 1.5, 1.5))
  list(geom_path(data = kzone,
                 aes(x = c(-0.75, -0.75, 0.75, 0.75, -0.75),
                     y = c(1.5, 3.5, 3.5, 1.5, 1.5)),
                 lwd = width, col = "blue", linetype = 2))
} # strike zone

nal_fcn <- function(){
  list(theme(axis.title.x=element_blank(), axis.title.y=element_blank())
       )
} # No-axis-labels function
