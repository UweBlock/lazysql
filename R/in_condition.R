#' Create SQL string to select values included in a set of given values
#'
#' @description
#'  Create string with SQL \code{IN} expression for \code{WHERE} clause to select values
#'  included in a set of given values.
#'
#' @param column_name [character(1)]\cr
#'  Name of data base column to select values from.
#' @param choices [character(1:Inf)] or [integer(1:Inf)]\cr
#'  The values which must be matched.
#' @param negation [character(1)]\cr
#'  If \code{"not"} the selection is inverted to a \code{NOT IN} expression.
#'
#' @return
#'  Character string to be used in SQL statement.
#' @author Uwe Block
#'
#' @examples
#' in_condition("COL_1", 1:3)
#' in_condition("COL_1", 1:3, "not")
#' in_condition("COL_1", LETTERS[2:3])
#' in_condition("COL_1", LETTERS[2:3], "not")
#'
#' @import magrittr
#' @export
in_condition <- function(
  column_name,
  choices,
  negation = c("", "not")
) {
  checkmate::assert_string(column_name, na.ok = FALSE, empty.ok = FALSE)
  checkmate::assert_character(column_name, pattern = valid_identifier_regex())
  checkmate::assert(
    checkmate::checkCharacter(choices, any.missing = FALSE,
                              min.len = 1L),
    checkmate::checkInteger(choices, any.missing = FALSE,
                            min.len = 1L)
  )
  checkmate::assert_subset(negation, eval(formals()$negation))
  negation <- match.arg(negation)
  checkmate::assert_string(negation, na.ok = FALSE, empty.ok = TRUE)
  # helper function
  prepare_values <- function(x) {
    if (is.character(x)) {
      return(shQuote(x))
    } else {
      return(as.character(x))
    }
  }
  # build sql
  sql <-
    choices %>%
    prepare_values %>%
    paste(collapse = ", ") %>%
    assertive.base::parenthesise() %>%
    paste(column_name, negation, "in", .)
  return(sql)
}
