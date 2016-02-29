<!-- README.md is generated from README.Rmd. Please edit that file -->
lazysql
=======

[![Travis-CI Build Status](https://travis-ci.org/UweBlock/lazysql.svg?branch=master)](https://travis-ci.org/UweBlock/lazysql)
[![Coverage Status](https://coveralls.io/repos/github/UweBlock/lazysql/badge.svg?branch=master)](https://coveralls.io/github/UweBlock/lazysql?branch=master)

Lazy SQL programming.

Helper functions to build SQL statements under program control for use with dbGetQuery or dbSendQuery.

Currently implemented are:

-   `date_between` Create SQL string to select date between two given dates
-   `in_condition` Create SQL string to select values included in a set of given values
-   `natural_key` Create SQL string for joining on matching natural keys

More patterns will be added as required.

Examples
--------

### date\_between

``` r
date1 <- as.Date("2016-02-22")
date2 <- as.Date("2016-02-11")

# SQL expression for date range
(sql_expr1 <- lazysql::date_between("STD_1", c(date1, date2)))
#> [1] "STD_1 between to_date('2016-02-11', 'yyyy-mm-dd') and to_date('2016-02-22', 'yyyy-mm-dd')"

# SQL expression for single date
(sql_expr2 <- lazysql::date_between("STD_1", date1))
#> [1] "STD_1 between to_date('2016-02-22', 'yyyy-mm-dd') and to_date('2016-02-22', 'yyyy-mm-dd')"

# sample SQL statements
paste("select * from TEST_TABLE where", sql_expr1)
#> [1] "select * from TEST_TABLE where STD_1 between to_date('2016-02-11', 'yyyy-mm-dd') and to_date('2016-02-22', 'yyyy-mm-dd')"

paste("select * from TEST_TABLE where", sql_expr2)
#> [1] "select * from TEST_TABLE where STD_1 between to_date('2016-02-22', 'yyyy-mm-dd') and to_date('2016-02-22', 'yyyy-mm-dd')"
```

### in\_condition

``` r
# SQL expressions
lazysql::in_condition("COL_1", 1:3)
#> [1] "COL_1  in (1, 2, 3)"

lazysql::in_condition("COL_1", 1:3, "not")
#> [1] "COL_1 not in (1, 2, 3)"

lazysql::in_condition("COL_1", LETTERS[2:3])
#> [1] "COL_1  in ('B', 'C')"

lazysql::in_condition("COL_1", LETTERS[2:3], "not")
#> [1] "COL_1 not in ('B', 'C')"
```

### natural\_key

``` r
# SQL expression
(sql_expr <- lazysql::natural_key(c("TAB1", "tab_2"),c("COL1", "col_2")))
#> [1] "TAB1.COL1 = tab_2.COL1 and TAB1.col_2 = tab_2.col_2"

# sample SQL JOIN statement
paste("select * from TAB1, TAB2 where", sql_expr)
#> [1] "select * from TAB1, TAB2 where TAB1.COL1 = tab_2.COL1 and TAB1.col_2 = tab_2.col_2"
```

Installation
------------

Get the development version from github:

``` r
if (!"devtools" %in% installed.packages()) install.packages("devtools")
devtools::install_github("UweBlock/lazysql")
```

CRAN release is in preparation.
