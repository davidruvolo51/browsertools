
<!-- badges: start -->
![version](https://img.shields.io/github/package-json/v/davidruvolo51/browsertools/prod?color=%2326709e)
[![R build status](https://github.com/davidruvolo51/browsertools/workflows/R-CMD-check/badge.svg)](https://github.com/davidruvolo51/browsertools/actions)
<!-- badges: end -->

# browsertools

This package contains a series of functions for running JavaScript functions in shiny. These functions are wrappers for custom message handlers for routine DOM manipulation within shiny server. All JavaScript functions were written in vanilla JS and compiled using babel.js.

## Install

You can install the latest release of `browsertools` in R using the following command.

```r
remotes::install_github("davidruvolo51/browsertools@*release")
```

## Use

To use this package in a shiny app, call `use_browsertools` at the top of the UI (this function loads the package dependencies directly into the client).

```r
# ui
ui <- tagList(
    browsertools::use_browsertools()
    ...
)
```

The package offers the following functions.

### Shiny UI

| function            | arguments | description                                          |
|---------------------|-----------|------------------------------------------------------|
| `enable_attributes` | ---       | access HTML attributes of an element (`id` required) |
| `hidden`            | `...`     | Hide element(s) by default                           |
| `use_browsertools`  | ---       | load `browsertools` into your shiny app (required)   |

### Shiny Server

| function                   | arguments                 | description                              |
|----------------------------|---------------------------|------------------------------------------|
| `add_css`                  | `elem`, `css`             | add css class(es)                        |
| `as_js_object`             | `x`                       | convert an R object to javascript object |
| `console_error`            | `message`                 | send an error message to the console     |
| `console_log`              | `message`, `expand`       | log values to the browser console        |
| `console_table`            | `data`                    | display R data in the console            |
| `console_warn`             | `message`                 | send a warning message to the console    |
| `debug`                    | ---                       | print JS errors in the R console         |
| `hide_elem`                | `elem`                    | hides an element                         |
| `inner_html`               | `elem`, `string`, `delay` | set the inner html of an element         |
| `inner_text`               | `elem`, `string`, `delay` | set the inner text of an element         |
| `insert_adjacent_html`     | `id`, `html`, `position`  | insert a new child element(s)            |
| `print_elem`               | `elem`                    | print an html element in the R console   |
| `refresh_page`             | ---                       | trigger a page refresh                   |
| `remove_css`               | `elem`, `css`             | remove css class(es)                     |
| `remove_element_attribute` | `elem`, `attr`            | remove an attribute from an element      |
| `remove_element`           | `elem`                    | remove an element                        |
| `scroll_to`                | `x`, `y`, `elem`          | scroll to a point or element             |
| `set_document_title`       | `title`, `append`         | change the title of the document         |
| `set_element_attribute`    | `elem`, `attr`, `value`   | update an attribute of an element        |
| `show_elem`                | `elem`                    | show an element                          |
| `toggle_css`               | `elem`, `css`             | toggle css class(es)                     |
| `toggle_elem`              | `elem`                    | toggle the state of an element           |
