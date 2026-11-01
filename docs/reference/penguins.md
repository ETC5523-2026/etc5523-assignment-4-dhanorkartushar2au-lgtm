# Palmer penguins body measurements

A cleaned copy of the Palmer Penguins dataset: body-size measurements
for three penguin species observed on three islands in the Palmer
Archipelago, Antarctica. Rows with missing measurements or sex have been
removed. Built by `data-raw/penguins.R`.

## Usage

``` r
penguins
```

## Format

A data frame with 333 rows and 9 variables:

- species:

  Factor. Penguin species: Adelie, Chinstrap or Gentoo.

- island:

  Factor. Island of observation: Biscoe, Dream or Torgersen.

- sex:

  Factor. Penguin sex: female or male.

- year:

  Integer. Study year (2007-2009).

- bill_length_mm:

  Numeric. Bill (culmen) length, in millimetres.

- bill_depth_mm:

  Numeric. Bill (culmen) depth, in millimetres.

- flipper_length_mm:

  Integer. Flipper length, in millimetres.

- body_mass_g:

  Integer. Body mass, in grams.

- body_mass_kg:

  Numeric. Body mass, in kilograms (derived).

## Source

Horst AM, Hill AP, Gorman KB (2020). palmerpenguins: Palmer Archipelago
(Antarctica) penguin data. R package.
<https://allisonhorst.github.io/palmerpenguins/>
