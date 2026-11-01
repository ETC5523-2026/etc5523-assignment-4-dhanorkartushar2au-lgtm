# Exploring penguin sizes with penguinscope

## What penguinscope is for

`penguinscope` helps someone new to the Palmer Penguins data answer one
question: **how do the body measurements of the three penguin species
differ, and does that depend on the island or the penguin’s sex?** It
bundles a cleaned `penguins` dataset, a summary function, and a Shiny
app.

## Installation

Install the package from GitHub:

``` r

# install.packages("remotes")
remotes::install_github("ETC5523-2026/etc5523-assignment-4-dhanorkartushar2au-lgtm")
```

``` r

library(penguinscope)
#> 
#> Attaching package: 'penguinscope'
#> The following object is masked from 'package:datasets':
#> 
#>     penguins
```

## The data

The package includes the `penguins` dataset (333 penguins):

``` r

head(penguins)
#>   species    island    sex year bill_length_mm bill_depth_mm flipper_length_mm
#> 1  Adelie Torgersen   male 2007           39.1          18.7               181
#> 2  Adelie Torgersen female 2007           39.5          17.4               186
#> 3  Adelie Torgersen female 2007           40.3          18.0               195
#> 4  Adelie Torgersen female 2007           36.7          19.3               193
#> 5  Adelie Torgersen   male 2007           39.3          20.6               190
#> 6  Adelie Torgersen female 2007           38.9          17.8               181
#>   body_mass_g body_mass_kg
#> 1        3750        3.750
#> 2        3800        3.800
#> 3        3250        3.250
#> 4        3450        3.450
#> 5        3650        3.650
#> 6        3625        3.625
```

## Summarising the data

[`summarise_penguins()`](https://etc5523-2026.github.io/etc5523-assignment-4-dhanorkartushar2au-lgtm/reference/summarise_penguins.md)
returns the count, mean, spread and range of a chosen measurement for
each group. For example, body mass by species:

``` r

summarise_penguins(penguins, "body_mass_g")
#> # A tibble: 3 × 6
#>   species       n  mean    sd   min   max
#>   <fct>     <int> <dbl> <dbl> <int> <int>
#> 1 Adelie      146 3706.  459.  2850  4775
#> 2 Chinstrap    68 3733.  384.  2700  4800
#> 3 Gentoo      119 5092.  501.  3950  6300
```

Gentoo penguins are clearly the heaviest (a mean around 5000 g), while
Adelie and Chinstrap are similar and lighter.

## Launching and using the app

To explore the data interactively, launch the Shiny app:

``` r

launch_app()
```

In the app you can pick a **measurement** to compare, then tick or
untick **species**, **islands** and **sex** to focus on particular
groups. The boxplot and the summary table update to your selection.

## Interpreting the outputs

The boxplot shows the distribution of the chosen measurement for each
species — the box is the middle half of the penguins and the line is the
median, so a higher box means larger penguins. The table gives the exact
mean and spread.

With body mass selected, for instance, Gentoo penguins are far heavier
than the other two species, and that difference holds across islands and
both sexes. Narrowing to a single species on a single island (such as
Gentoo on Dream) returns no penguins — some species live on only one
island — and the app shows a message in that case.
