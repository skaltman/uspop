
<!-- README.md is generated from README.Rmd. Please edit that file -->

# uspop

<!-- badges: start -->

[![Codecov test
coverage](https://codecov.io/gh/skaltman/uspop/branch/master/graph/badge.svg)](https://codecov.io/gh/skaltman/uspop?branch=master)
[![R build
status](https://github.com/skaltman/uspop/workflows/R-CMD-check/badge.svg)](https://github.com/skaltman/uspop/actions)
<!-- badges: end -->

uspop makes it easy to retrieve historical U.S. population estimates for
states, counties, or the entire country.

All estimates are from the Census Bureau’s [Vintage 2019 Population
Estimates
API](https://www.census.gov/data/developers/data-sets/popest-popproj/popest.Vintage_2019.html).

## Installation

You can install uspop from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("skaltman/uspop")
```

## Retrieve populations

``` r
library(uspop)
```

You can retrieve population estimates from 2010-2019 for the entire
U.S., states, or counties.

``` r
# Entire U.S.
population(geography = "us")

# All states
population(geography = "state")

# All counties
population(geography = "county")
```

Each resulting tibble has four columns:

  - `region`
  - `fips`
  - `year`
  - `pop`

<!-- end list -->

``` r
population(geography = "us")
#> # A tibble: 10 x 4
#>    region        fips   year       pop
#>    <chr>         <chr> <int>     <dbl>
#>  1 United States 0L     2010 309321666
#>  2 United States 0L     2011 311556874
#>  3 United States 0L     2012 313830990
#>  4 United States 0L     2013 315993715
#>  5 United States 0L     2014 318301008
#>  6 United States 0L     2015 320635163
#>  7 United States 0L     2016 322941311
#>  8 United States 0L     2017 324985539
#>  9 United States 0L     2018 326687501
#> 10 United States 0L     2019 328239523
```

`fips` is `"0"` for the United States, and the state or county FIPS for
states and counties.
