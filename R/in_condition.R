make_sql_in_condition <- function(
  var_name,
  selected_values,
  negate = FALSE
) {
  checkmate::assert_string(var_name, empty.ok = FALSE)
  checkmate::assert(
    checkmate::checkCharacter(selected_values, any.missing = FALSE,
                              min.len = 1L),
    checkmate::checkInteger(selected_values, any.missing = FALSE,
                            min.len = 1L)
  )
  checkmate::assert_flag(negate)
  # helper function
  prepare_values <- function(x) {
    if (is.character(x)) {
      return(shQuote(x))
    } else {
      return(as.character(x))
    }
  }
  # build sql
  negation_phrase <- if (negate) "not" else ""
  sql <-
    selected_values %>%
    prepare_values %>%
    paste(collapse = ", ") %>%
    assertive.base::parenthesise() %>%
    paste(var_name, negation_phrase, "in", .)
  return(sql)
}
