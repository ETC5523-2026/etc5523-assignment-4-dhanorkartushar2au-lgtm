#' Launch the penguinscope Shiny app
#'
#' Starts the interactive Shiny application bundled with the package.
#'
#' @return No return value; called to launch the app.
#' @export
#'
#' @examples
#' if (interactive()) {
#'   launch_app()
#' }
launch_app <- function() {
  app_dir <- system.file("app", package = "penguinscope")
  if (app_dir == "") {
    stop("Could not find the app. Try re-installing penguinscope.", call. = FALSE)
  }
  shiny::runApp(app_dir, display.mode = "normal")
}