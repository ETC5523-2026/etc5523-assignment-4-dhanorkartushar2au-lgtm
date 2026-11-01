# Summarise a penguin measurement by a grouping variable

Computes the number of penguins and the mean, standard deviation and
range of a chosen body measurement within each level of a grouping
variable. Used by the Shiny app and the vignette to turn the raw
[penguins](https://etc5523-2026.github.io/etc5523-assignment-4-dhanorkartushar2au-lgtm/reference/penguins.md)
data into a compact summary table.

## Usage

``` r
summarise_penguins(data, measure = "body_mass_g", group = "species")
```

## Arguments

- data:

  A data frame of penguin records, such as
  [penguins](https://etc5523-2026.github.io/etc5523-assignment-4-dhanorkartushar2au-lgtm/reference/penguins.md)
  or a filtered subset of it.

- measure:

  Name of the measurement column to summarise, as a string (e.g.
  `"body_mass_g"` or `"flipper_length_mm"`).

- group:

  Name of the column to group by, as a string. Defaults to `"species"`.

## Value

A data frame with one row per group and the columns: the grouping
variable, `n`, `mean`, `sd`, `min` and `max`.

## Examples

``` r
summarise_penguins(penguins, "body_mass_g")
#> # A tibble: 3 × 6
#>   species       n  mean    sd   min   max
#>   <fct>     <int> <dbl> <dbl> <int> <int>
#> 1 Adelie      146 3706.  459.  2850  4775
#> 2 Chinstrap    68 3733.  384.  2700  4800
#> 3 Gentoo      119 5092.  501.  3950  6300
summarise_penguins(penguins, "flipper_length_mm", group = "island")
#> # A tibble: 3 × 6
#>   island        n  mean    sd   min   max
#>   <fct>     <int> <dbl> <dbl> <int> <int>
#> 1 Biscoe      163  210. 14.3    172   231
#> 2 Dream       123  193.  7.43   178   212
#> 3 Torgersen    47  192.  6.22   176   210
```
