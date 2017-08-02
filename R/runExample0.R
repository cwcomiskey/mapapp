#' @export
runExample0 <- function() {
  appDir <- system.file("shiny-examples", "hmci", package = "mapapp")
  if (appDir == "") {
    stop("Could not find example directory. Try re-installing `mypackage`.", call. = FALSE)
  }

  shiny::runApp(appDir, display.mode = "normal")
}
