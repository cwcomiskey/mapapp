# load("~/Desktop/ResearchRepo/mapapp/R/sysdata.rda")

# devtools::load_all() # automatically source files in R/ folder

# devtools::use_package("shiny") # add dependency to DESCRIPTION file
  # --> Refer to functions with package::fun()

# devtools::use_data(df0) # add `hitter` to data/
# devtools::use_data(hitzone, CIlist0, CIlistn, internal = TRUE)
# devtools::use_data(CIdata0, overwrite = TRUE)

# devtools::use_build_ignore("mapit.R") # Exclude file or directory from bundled version

# devtools::document()

# install.packages("devtools")
# devtools::install_github('cwcomiskey/mapapp')
# library(mapapp)

# test <- function(x = 5){x + 10}
# test()
# test(3)
# test(x = 8)

# devtools::use_vignette("mapapp")

