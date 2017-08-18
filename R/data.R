#' 9177 swings by baseball player Jhonny Peralta
#'
#' A dataset containing the location and outcome of 9177 Jhonny Peralta swings between 2008 and 2016.
#'
#' @format A data frame with 9177 rows and 4 variables:
#' \describe{
#'   \item{px}{horizontal location, in feet, from the middle of home plate when the pitch passed through the strike zone}
#'   \item{pz}{vertical location, in feet, from the ground when the pitch passed through the strike zone (negative values correspond to pitches that bounced before reaching home plate)}
#'   \item{des}{A short description of the swing outcome}
#'   \item{hit}{Bernoulli outcome: 1 if swing resulted in a hit, 0 otherwise}
#' }
#' @source \url{http://www.baseballheatmaps.com/pitch-fx-download/}
#' @source \url{http://www.mlbam.com/}
"hitter"

#' Data frame of spatial coordinates and variables
#'
#' A dataset containing spatial coordinates and three model predicted values for each location.
#'
#' @format A data frame with 9177 rows and 4 variables:
#' \describe{
#'   \item{px}{horizontal location}
#'   \item{pz}{vertical location}
#'   \item{logit}{First model predicted value}
#'   \item{SE_logit}{Second model predicted value}
#'   \item{phat}{Third model predicted value}
#' }
"peralta_ests"

#' List of 99 data frames
#'
#' The 99 data frames provide upper and lower bounds for each confidence level associated with the point estimates in \code{\link{peralta_ests}}.
#'
#' @format A list of 99 data frames, the $i$th data frame corresponds to the $i$% CI with columns:
#' \describe{
#'   \item{lb}{Lower bound}
#'   \item{ub}{Upper bound}
#' }
"peralta_cis"

#' \code{peralta} formatted for \code{shinyHMCI(...)}
#'
#' This list combines \code{\link{peralta_ests}} and \code{\link{peralta_cis}} formatted appropriately for \code{shinyHMCI(...)}.
#'
#' @format A lists of 100 data frames.  Element one is \code{\link{peralta_ests}}, elements 2-100 are \code{\link{peralta_cis}}.
"peralta"






