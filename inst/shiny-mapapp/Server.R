library(shiny)
library(ggplot2)

shinyServer(function(input, output) {

   output$alpha_text <- renderText({
    # paste("You have selected a ", input$"Pct CI", "% confidence interval.")
  })

  output$HeatMapL <- renderPlot({
    with(CIdata[[input$"Pct CI" + 1]], shiny_hmci_fcn(dataset = CIdata[[1]], plb))
    })

  output$HeatMap <- renderPlot({
    with(CIdata[[1]], shiny_hmci_fcn(dataset = CIdata[[1]], stat1))
  })

  output$HeatMapU <- renderPlot({
    with(CIdata[[input$"Pct CI" + 1]], shiny_hmci_fcn(dataset = CIdata[[1]], pub))
  })

})

# Usage: with(megalist[[i+1]], shiny_hmci_fcn(mega-list[[1]], fill))
