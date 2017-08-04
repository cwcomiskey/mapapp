#' Create an Interactive Heat Map Confidence Interval (with Shiny)
#'
#' This function creates an interactive heat map confidence interval in Shiny.
#'
#' @param CIdata A list with 100 data frames as elements. The first data frame element must contain: coordinates named \code{x} and \code{y}, and point estimate \code{stat}. The remaining 99 data frame elements consist of two columns each: lower bound, and upper bound.
#'
#' @return A heat map, representing \code{stat} with a color at each (\code{x}, \code{y}) location.
#' @export
#' @examples
#' data(CIdata0)
#' mapify(CIdata0[[1]])

shinyit <- function(CIdata){

shinyApp(

  ui = fluidPage(
    titlePanel("Dynamic Heat Map Confidence Intervals"),
    fluidRow(
      column(4, plotOutput("HeatMapL")),
      column(4, plotOutput("HeatMap")),
      column(4, plotOutput("HeatMapU"))
    ),
    fluidRow(
      column(6, sliderInput("Pct CI", label = h3("Confidence Interval"), min = 1, max = 99, value = 0.95)),
      column(6, textOutput("alpha_text"))
    )
    ),

  server = function(input, output) {
    # output$alpha_text <- renderText({ paste("You have selected a ", input$"Pct CI", "% confidence interval.")})
    output$HeatMapL <- renderPlot({
      with(CIdata[[input$"Pct CI" + 1]], mapify(dataset = CIdata[[1]], plb))
    })
    output$HeatMap <- renderPlot({
      with(CIdata[[1]], mapify(dataset = CIdata[[1]], stat1))
    })
    output$HeatMapU <- renderPlot({
      with(CIdata[[input$"Pct CI" + 1]], mapify(dataset = CIdata[[1]], pub))
    })

  }
  )

  }
