# LOAD in THIS ORDER ---- and HMCI APP works
load("~/Desktop/ResearchRepo/mapapp/data/hitter.rda")
source('~/Desktop/ResearchRepo/mapapp/R/mapit.R')
source('~/Desktop/ResearchRepo/mapapp/R/process.R')
source('~/Desktop/ResearchRepo/mapapp/R/mapapp.R')
runApp("R") # b/c containing folder is "R"



devtools::load_all() # automatically source files in R/ folder

devtools::use_package("shiny") # add dependency to DESCRIPTION file
  # --> Refer to functions with package::fun()

devtools::use_data(hitter, overwrite = TRUE) # add `hitter` to data/

devtools::document()
