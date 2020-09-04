#' uspop
#'
#' Historical U.S. population estimates
#'
#' @docType package
#' @name uspop
#' @importFrom stringr str_glue str_detect str_extract
#' @importFrom jsonlite fromJSON
#' @importFrom tibble as_tibble
#' @importFrom dplyr slice filter mutate select if_else arrange
#' @importFrom rlang .data
utils::globalVariables(".")
