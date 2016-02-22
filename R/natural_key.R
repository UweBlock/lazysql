make_sql_natural_key <- function(
  tab_names,
  key_names
) {
  library(magrittr)
  checkmate::assert_character(
    tab_names,
    min.char = 1L, len = 2L, any.missing = FALSE, unique = TRUE)
  checkmate::assert_character(
    key_names,
    min.char = 1L, min.len = 1L, any.missing = FALSE, unique = TRUE)
  # create sql string in 3 steps:
  # 1. combine table names with key names, eg., "PRL.FLIGHT_NR"
  # 2. create logical expressions, eg, "PRL.FLIGHT_NR = PRL_SSR.FLIGHT_NR"
  # 3. concatenate logical expressions by "and" to form final sql
  sql <-
    vapply(tab_names, FUN = paste, FUN.VALUE = character(length(key_names)),
           key_names, sep = ".") %>%
    plyr::aaply(.margins = 1, .fun = paste, collapse = " = ") %>%
    paste(collapse = " and ")
  return(sql)
}
