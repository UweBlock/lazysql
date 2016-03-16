#' Lazy SQL programming
#'
#' @description
#'  Helper functions to build SQL statements under program control
#'  for \code{\link[DBI]{dbGetQuery}}, \code{\link[DBI]{dbSendQuery}},
#'  \code{\link[sqldf]{sqldf}}, etc.
#'  They are intended to increase speed of coding and
#'  to reduce coding errors. Arguments are carefully checked,
#'  in particular SQL identifiers such as names of tables or columns.
#'  More patterns will be added as required.
#'
#' @author Uwe Block
#'
#' @seealso
#'  \code{\link{date_between}},
#'  \code{\link{in_condition}},
#'  \code{\link{natural_key}}
#'
#' @name lazysql
#' @docType package
NULL
