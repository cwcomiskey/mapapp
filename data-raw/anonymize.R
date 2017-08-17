# load("~/Desktop/ResearchRepo/mapapp/R/sysdata.rda")
#
# CIlist0 <- CI_list # mega-list w/ necessities
#
# head(CIlist0$hitzone)
# #          px pz     logit  SE_logit         phat
# # 1 -1.500000  1 -7.766765 0.5851134 0.0004234020
# # 2 -1.438776  1 -7.500292 0.5616453 0.0005526172
# # 3 -1.377551  1 -7.245439 0.5395651 0.0007129121
#
# names(CIlist0$hitzone) <- c("x", "y", "stat0", "SEstat0", "stat1")
# names(CIlist0) <- "df0"
#
# str(CIlist0)
# # List of 1
# #   $ df0:'data.frame':	3500 obs. of  5 variables:
# # ..$ x       : num [1:3500] -1.5 -1.44 -1.38 -1.32 -1.26 ...
# # ..$ y       : num [1:3500] 1 1 1 1 1 1 1 1 1 1 ...
# # ..$ stat0   : Named num [1:3500] -7.77 -7.5 -7.25 -7 -6.77 ...
# # ..$ SEstat0 : Named num [1:3500] 0.585 0.562 0.54 0.519 ...
# # ..$ stat1   : Named num [1:3500] 0.000423 0.000553 0.000713 ...
