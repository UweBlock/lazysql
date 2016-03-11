# lazysql 0.1.3

* Add cran-comments.md file.
* Add CONDUCT.md file (Contributor Code of Conduct).
* Improve description of purpose of package in DESCRIPTION and README.md files.
* Give better explanation of validity checks of parameters in function documentation.
* Export `valid_identifier_regex()` again to explain validity check of 
  SQL table names and column names.

# lazysql 0.1.2

* Replace `shQuote` because it returns escaped double quotes on 
  Windows instead of single quotes.
* Fix issues caused by changes in new version v1.7.2 of package `checkmate`.
* Remove dependency on package `assertive.base`.
* Declare global variables to avoid notes from CRAN check wenn using `.` 
  from package `magrittr`.
* Update documentation.
* Add continuous integration with `travis-ci`, `appveyor`, and `coveralls`.

# lazysql 0.1.1

* Don't allow `choices` to contain quotes in `in_condition()`.
* Update documentation and examples.
* Add a `NEWS.md` file to track changes to the package.
* Add a `README.Rmd` file.

# lazysql 0.1.0

* Initial release


