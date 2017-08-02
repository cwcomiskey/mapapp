library(shiny)


shinyUI(fluidPage(

  titlePanel("Dynamic Heat Map Confidence Intervals"),

  fluidRow(
     column(4, plotOutput("HeatMapL")),
     column(4, plotOutput("HeatMap")),
     column(4, plotOutput("HeatMapU"))
  ),

  fluidRow(
     column(6, sliderInput("Pct CI",
                 label = h3("Confidence Interval"),
                 min = 1, max = 99, value = 0.95)),
     column(6, textOutput("alpha_text"))
       )))
