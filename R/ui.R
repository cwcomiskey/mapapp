# ui.R

shinyUI(fluidPage(
  
  titlePanel("Dynamic Heat Map Confidence Intervals"),
  
  fluidRow( 
     column(4, plotOutput("HeatMapL"), style='padding:0px;'),
     column(4, plotOutput("HeatMap"),  style='padding:0px;'),
     column(4, plotOutput("HeatMapU"), style='padding:0px;')
  ),

  fluidRow(
     column(6, sliderInput("Pct CI",
                 label = h3("Confidence Interval"),
                 min = 1, max = 99, value = 0.95), 
            style='padding:10px;'),
     column(6, textOutput("alpha_text"), style='padding:0px;')
       )))