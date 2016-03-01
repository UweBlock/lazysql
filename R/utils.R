# avoid CRAN notes when using magrittr
utils::globalVariables(".")

#' Regex pattern for valid SQL identifier names
#'
#' @description
#' Returns a regular expression for valid unquoted SQL identifiers.
#' The identifier must start with an alphabetic character followed by
#' alphanumeric characters or the underscore \code{_}.
#'
#' @return Character string with regular expression
#'
#' @references
#' ORACLE Database SQL Language Reference
#'
#' @author Uwe Block
#' @examples
#' lazysql::valid_identifier_regex()
#' @export
#'
valid_identifier_regex <- function() {
  return("^[[:alpha:]][_[:alnum:]]*$")
}
