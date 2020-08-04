# browsertools 0.1.73

* The functions `hide_elem`, `show_elem` and `toggle_elem` now use `hidden` attribute by default. Rather than `aria_hidden`.
* Added dev Shiny app for building and debugging package functions
* Improved error messages in `debug`. Added additional description for `TypeErrors`.
* Removed CSS asset (this is no longer needed)
* Minor adjustments to browsertools demo

# browsertools 0.1.72

* Changed argument name for user defined content in the functions `inner_text`, `inner_html`, `insert_adjacent_html`. Change function arguments from `string` or `html` to `content`. 
* Isolated functions in `R/handlers.R` into separate files
* Created package management R file (see `dev/`)
* Restructured `inst/browsertools/` to eliminate additional paths (`css` and `js`). Source files are now located in `inst/browsertools/src`.
* Added a `NEWS.md` file to track changes to the package.
* Upgraded `usethis` to address issue with R-CMD-CHECK (stale branches)