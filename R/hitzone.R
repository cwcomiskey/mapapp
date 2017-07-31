# Points for plotting  ====
hitzoner <- function(){
  cbind(expand.grid(px = seq(-1.5, 1.5, length = 50),
                    pz = seq(1, 4, length = 70))) %>%
    mutate(r = sqrt( (px + 2)^2 + (pz - 3.5)^2),
           theta = atan2(pz - 3.5, px + 2))
}
