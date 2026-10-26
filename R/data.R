#' Palmer penguins body measurements
#'
#' A cleaned copy of the Palmer Penguins dataset: body-size measurements for
#' three penguin species observed on three islands in the Palmer Archipelago,
#' Antarctica. Rows with missing measurements or sex have been removed. Built
#' by `data-raw/penguins.R`.
#'
#' @format A data frame with 333 rows and 9 variables:
#' \describe{
#'   \item{species}{Factor. Penguin species: Adelie, Chinstrap or Gentoo.}
#'   \item{island}{Factor. Island of observation: Biscoe, Dream or Torgersen.}
#'   \item{sex}{Factor. Penguin sex: female or male.}
#'   \item{year}{Integer. Study year (2007-2009).}
#'   \item{bill_length_mm}{Numeric. Bill (culmen) length, in millimetres.}
#'   \item{bill_depth_mm}{Numeric. Bill (culmen) depth, in millimetres.}
#'   \item{flipper_length_mm}{Integer. Flipper length, in millimetres.}
#'   \item{body_mass_g}{Integer. Body mass, in grams.}
#'   \item{body_mass_kg}{Numeric. Body mass, in kilograms (derived).}
#' }
#' @source Horst AM, Hill AP, Gorman KB (2020). palmerpenguins: Palmer
#'   Archipelago (Antarctica) penguin data. R package.
#'   <https://allisonhorst.github.io/palmerpenguins/>
"penguins"