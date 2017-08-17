#' Create an Interactive Heat Map Confidence Interval (with Shiny)
#'
#' This function creates an interactive heat map confidence interval in Shiny.
#'
#' @param CIdata A list with 100 data frames as elements. The first data frame element must contain: coordinates named `x` and `y`, and point estimate `stat`. The remaining 99 data frame elements consist of two columns each: lower bound, and upper bound.
#'
#' @return A heat map, representing \code{stat} with a color at each (\code{x}, \code{y}) location.
#' @export
#' @examples
#' #shinyHMCI(FinalList)

shinyHMCI <- function(CIdata){

shiny::shinyApp(

  ui = shiny::fluidPage(
    shiny::titlePanel("Interactive Heat Map Confidence Intervals"),
    shiny::fluidRow(
      shiny::column(4, shiny::plotOutput("HeatMapL")),
      shiny::column(4, shiny::plotOutput("HeatMap")),
      shiny::column(4, shiny::plotOutput("HeatMapU"))
    ),
    shiny::fluidRow(
      shiny::column(6, shiny::sliderInput("Pct CI", label = shiny::h3("Confidence Interval"), min = 1, max = 99, value = 0.95)),
      shiny::column(6, shiny::textOutput("alpha_text"))
    )
    ),

  server = function(input, output) {
    output$alpha_text <- shiny::renderText({ paste("This is the ",input$"Pct CI","% confidence interval layer.")})
    output$HeatMapL <- shiny::renderPlot({
      heatmapper(dataset = CIdata[[1]], CIdata[[input$"Pct CI" + 1]]$lb, plot_title = "Lower Bound")
    })
    output$HeatMap <- shiny::renderPlot({
      heatmapper(dataset = CIdata[[1]], CIdata[[1]]$stat, plot_title = "Point Estimate")
    })
    output$HeatMapU <- shiny::renderPlot({
      heatmapper(dataset = CIdata[[1]], CIdata[[input$"Pct CI" + 1]]$ub, plot_title = "Upper Bound")
    })

  }
  )
  }
