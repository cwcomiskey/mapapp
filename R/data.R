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
"InitialDF"

#' List of 100 data frames
#'
#' The first element is the \code{InitialDF} data frame. The remaining 99 data frames provide upper and lower bounds for each confidence level.
#'
#' @format A data frame with 9177 rows and 4 variables:
#' \describe{
#'   \item{px}{horizontal location}
#'   \item{pz}{vertical location}
#'   \item{logit}{First model predicted value}
#'   \item{SE_logit}{Second model predicted value}
#'   \item{phat}{Third model predicted value}
#'   \item{lb}{Confidence level and location specific lower bound}
#'   \item{ub}{Confidence level and location specific lower bound}
#' }
"InitialList"

#' \code{InitialList} formatted for \code{shinyHMCI(...)}
#'
#' This list is \code{InitialList} formatted appropriately for \code{shinyHMCI(...)}.
#'
#' @format A data frame with 9177 rows and 4 variables:
#' \describe{
#'   \item{x}{horizontal location}
#'   \item{y}{vertical location}
#'   \item{stat}{Statistic of interest}
#'   \item{lb}{Confidence level and location specific lower bound}
#'   \item{ub}{Confidence level and location specific lower bound}
#' }
"FinalList"






