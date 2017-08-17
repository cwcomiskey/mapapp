# load("~/Desktop/ResearchRepo/mapapp/R/sysdata.rda")

# External Data ========= #
# df0: 'data.frame': [1] "px"  "pz"   "logit"    "SE_logit" "phat"
# list0: [[df0]] [[lb, ub]], [[lb, ub]], ...)
# listn: [["x"  "y"  "stat"]], [[lb, ub]], [[lb, ub]], ...)

# Internal Data ========= #
# hitter: df: 9177 x 4: "px"  "pz"  "des" "hit"
# hitzone: df: 3500 x 7: "px"  "pz"  "r"  "theta"  "logit"  "SE_logit" "phat"

# devtools::load_all() # automatically source files in R/ folder

# devtools::use_package("shiny") # add dependency to DESCRIPTION file
  # --> Refer to functions with package::fun()

# devtools::use_data(FinalList, InitialDF, InitialList, internal = FALSE, overwrite = TRUE) # add `hitter` to data/
# devtools::use_data(hitter, overwrite = TRUE)
# devtools::use_data(initial_df, initial_list, final_list, overwrite = TRUE)

# devtools::use_build_ignore("mapit.R") # Exclude file or directory from bundled version

# devtools::document()

# install.packages("devtools")
# devtools::install_github('cwcomiskey/mapapp')
# library(mapapp)
# shinyit(listn)

# test <- function(x = 5){x + 10}
# test()
# test(3)
# test(x = 8)

# devtools::use_vignette("mapapp")

