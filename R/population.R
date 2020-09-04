#' Create FIPS code for different geographies
#'
#' @description Creates the FIPS vector for the population data
#'
#' @param data A tibble that is the result of Population Estimates API call
#' @param geography Either "us", "state", or "county".
#'
#' @return Character vector of FIPS codes.
#' @keywords internal
#'
create_fips <- function(data, geography) {
  if (geography == "us") {
    fips <- "0L"
  } else if (geography == "state") {
    fips <- data$state
  } else if (geography == "county") {
    fips <- str_glue("{data$state}{data$county}") %>% as.character()
  }
}

#' Historical U.S. populations
#'
#' @description Historical population data (2010-2019) for U.S. states, counties,
#' or the entire country from the Census Bureau's Population Estimates API.
#'
#' @details `population()` uses the [Vintage 2019 API](https://www.census.gov/data/developers/data-sets/popest-popproj/popest.Vintage_2019.html),
#' which supplies data from 2010 to 2019.
#'
#' @param geography Either "us", "state", or "county".
#'
#' @return Tibble with four columns: `region`, `fips`, `year`, and `pop`.
#'
#' @seealso Retrieve U.S. boundaries with [ussf::boundaries()]
#' @export
#'
#' @examples
#' population(geography = "us")
#' population(geography = "state")
#' population(geography = "county")
population <- function(geography = c("us", "state", "county")) {

  geography <- match.arg(geography)

  geography_code <-
    if_else(
      geography %in% c("state", "county"),
      str_glue("{geography}:*"),
      geography
    )

  v <-
    str_glue(
      "https://api.census.gov/data/2019/pep/population?get=NAME,POP,DATE_CODE,DATE_DESC&for={geography_code}"
    ) %>%
    jsonlite::fromJSON() %>%
    as_tibble(.name_repair = "unique")

  names(v) <- v[1,] %>% as.character()

  v %>%
    slice(-1) %>%
    filter(str_detect(.data$DATE_DESC, str_glue("^7/1/"))) %>%
    mutate(
      year = str_extract(.data$DATE_DESC, "\\d{4}") %>% as.integer(),
      fips = create_fips(., geography),
      pop = as.double(.data$POP)
    ) %>%
    select(region = .data$NAME, .data$fips, .data$year, .data$pop) %>%
    arrange(.data$region, .data$year)
}

