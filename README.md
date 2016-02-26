<!-- README.md is generated from README.Rmd. Please edit that file -->
lazysql
=======

Lazy SQL programming.
---------------------

Helper functions to create SQL expressions which can be combined to SQL statements under program control.

Currently implemented are:

-   `date_between` Create SQL string to select date between two given dates
-   `in_condition` Create SQL string to select values included in a set of given values
-   `natural_key` Create SQL string for joining on matching natural keys

Sample usage
------------

### date\_between

``` r
date1 <- as.Date("2016-02-22")
date2 <- as.Date("2016-02-11")
paste("select * from TEST_TABLE where", lazysql::date_between("STD_1", c(date1, date2)))
#> [1] "select * from TEST_TABLE where STD_1 between to_date('2016-02-11', 'yyyy-mm-dd') and to_date('2016-02-22', 'yyyy-mm-dd')"
paste("select * from TEST_TABLE where", lazysql::date_between("STD_1", date1))
#> [1] "select * from TEST_TABLE where STD_1 between to_date('2016-02-22', 'yyyy-mm-dd') and to_date('2016-02-22', 'yyyy-mm-dd')"
```

### in\_condition

``` r
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
lazysql::natural_key(c("TAB1", "tab_2"),c("COL1", "col_2"))
#> [1] "TAB1.COL1 = tab_2.COL1 and TAB1.col_2 = tab_2.col_2"
```
