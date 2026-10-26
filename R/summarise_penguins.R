#' Summarise a penguin measurement by a grouping variable
#'
#' Computes the number of penguins and the mean, standard deviation and range of
#' a chosen body measurement within each level of a grouping variable. Used by
#' the Shiny app and the vignette to turn the raw [penguins] data into a compact
#' summary table.
#'
#' @param data A data frame of penguin records, such as [penguins] or a filtered
#'   subset of it.
#' @param measure Name of the measurement column to summarise, as a string
#'   (e.g. `"body_mass_g"` or `"flipper_length_mm"`).
#' @param group Name of the column to group by, as a string. Defaults to
#'   `"species"`.
#'
#' @return A data frame with one row per group and the columns: the grouping
#'   variable, `n`, `mean`, `sd`, `min` and `max`.
#' @importFrom rlang .data
#' @export
#'
#' @examples
#' summarise_penguins(penguins, "body_mass_g")
#' summarise_penguins(penguins, "flipper_length_mm", group = "island")
summarise_penguins <- function(data, measure = "body_mass_g", group = "species") {
  dplyr::summarise(
    dplyr::group_by(data, dplyr::across(dplyr::all_of(group))),
    n    = dplyr::n(),
    mean = mean(.data[[measure]], na.rm = TRUE),
    sd   = stats::sd(.data[[measure]], na.rm = TRUE),
    min  = min(.data[[measure]], na.rm = TRUE),
    max  = max(.data[[measure]], na.rm = TRUE),
    .groups = "drop"
  )
}