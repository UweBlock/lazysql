make_sql_date_between <- function(
  var_name,
  date_range
) {
  checkmate::assert_string(var_name)
  checkmate::assert_numeric(date_range, any.missing = FALSE,
                            min.len = 1L, max.len = 2L)
  checkmate::assert_class(date_range, "Date")
  fmt <- "to_date('%s', 'yyyy-mm-dd')"
  date_from <- sprintf(fmt, min(date_range))
  date_to <- sprintf(fmt, max(date_range))
  sql <- paste(var_name, "between", date_from, "and", date_to)
  return(sql)
}
