# lazysql 0.1.2

* Replaced `shQuote` in `in_condition()` because it behaves differently on 
  Windows.
* Fixed issues caused by changes in new version v1.7.2 of package `checkmate`.
* Removed dependency on package `assertive.base`.
* Declared global variables to avoid notes from CRAN check wenn using `.` 
  from package `magrittr`.
* Updated documentation.
* Added continuous integration with `travis-ci`, `appveyor`, and `coveralls`.

# lazysql 0.1.1

* Don't allow `choices` to contain quotes in `in_condition()`.
* Updated documentation and examples.
* Added a `NEWS.md` file to track changes to the package.
* Added a `README.Rmd` file.

# lazysql 0.1.0

* Initial release


