# shiny::runApp("R") # b/c containing folder is "R"

# Load internal data
# load("~/Desktop/ResearchRepo/mapapp/R/sysdata.rda")

# devtools::load_all() # automatically source files in R/ folder

# devtools::use_package("shiny") # add dependency to DESCRIPTION file
  # --> Refer to functions with package::fun()

# devtools::use_data(hitter, overwrite = TRUE) # add `hitter` to data/
# devtools::use_data(hitzone, CI_list, internal = TRUE, overwrite = TRUE) # internally


# devtools::use_build_ignore("devtools.R") # Exclude a specific file or directory from bundled version

# devtools::document()

# devtools::install_github('cwcomiskey/ResearchRepo','cwcomiskey')

# install.packages("devtools")
# devtools::install_github('cwcomiskey/mapapp')

# library(mapapp)
# CI_list <- CI_builder(CI_list)
# runExample()
