library(shiny)
# library(ggplot2)

shinyServer(function(input, output) {

   output$alpha_text <- renderText({
    # paste("You have selected a ", input$"Pct CI", "% confidence interval.")
  })

  output$HeatMapL <- renderPlot({
    with(CI_list[[input$"Pct CI" + 1]], shiny_hmci_fcn(dataset = CI_list[[1]], plb))
    })

  output$HeatMap <- renderPlot({
    with(CI_list[[1]], shiny_hmci_fcn(dataset = CI_list[[1]], phat))
  })

  output$HeatMapU <- renderPlot({
    with(CI_list[[input$"Pct CI" + 1]], shiny_hmci_fcn(dataset = CI_list[[1]], pub))
  })

})

# Usage: with(megalist[[i+1]], shiny_hmci_fcn(mega-list[[1]], fill))
