% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/population.R
\name{population}
\alias{population}
\title{Historical U.S. populations}
\usage{
population(geography = c("us", "state", "county"))
}
\arguments{
\item{geography}{Either "us", "state", or "county".}
}
\value{
Tibble with four columns: \code{region}, \code{fips}, \code{year}, and \code{pop}.
}
\description{
Historical population data (2010-2019) for U.S. states, counties,
or the entire country from the Census Bureau's Population Estimates API.
}
\details{
\code{population()} uses the \href{https://www.census.gov/data/developers/data-sets/popest-popproj/popest.Vintage_2019.html}{Vintage 2019 API},
which supplies data from 2010 to 2019.
}
\examples{
population(geography = "us")
population(geography = "state")
population(geography = "county")
}
\seealso{
Retrieve U.S. boundaries with \code{\link[ussf:boundaries]{ussf::boundaries()}}
}
