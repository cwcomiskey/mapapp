#' @export
runExample2 <- function() {
  appDir <- system.file("shiny-mapapp", package = "mapapp")
  if (appDir == "") {
    stop("Could not find example directory.
         Try re-installing `mypackage`.", call. = FALSE)
  }
  shiny::runApp(appDir, display.mode = "normal")
}
