![browsertools r package](browsertools.png)

<!-- badges: start -->
[![Travis build status](https://travis-ci.com/davidruvolo51/browsertools.svg?branch=prod)](https://travis-ci.com/davidruvolo51/browsertools)
[![R build status](https://github.com/davidruvolo51/browsertools/workflows/R-CMD-check/badge.svg)](https://github.com/davidruvolo51/browsertools/actions)
<!-- badges: end -->

# browsertools

This package contains a series of functions for running JavaScript functions in shiny. These functions are wrappers for custom message handlers for routine DOM manipulation within shiny server. All JavaScript functions were written in vanilla JS and compiled using babel.js.

## Install

You can install `browsertools` in R using the following command.

```r
devtools::install_github("davidruvolo51/browsertools")
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

| function | arguments | description | 
| :------- | :-------- | :---------- |
| `use_browsertools` | --- | load `browsertools` dependencies into your shiny app (required).
| `enable_attributes` | --- | allows you to access the HTML attributes of an element in the shiny server; Element must have an ID 
| `hidden` | `...` | Hide element(s) by default

### Shiny Server

| function  | arguments | description | 
| :-------  | :-------- | :---------- |
| `add_css` | `elem`, `css` | add a css class to an element
| `alert` | `message` | displays an alert in the browser
| `as_js_object` | `x` | a data.frame to convert to javascript object
| `console_error` | `message` | send an error message to the console
| `console_log` | `message`, `expand` | log values to the browser console
| `console_table` | `data` | a json object to display in the console; use `as_js_object` function to convert your data before passing into the function
| `console_warn` | `message` | send a warning message to the console
| `debug` | --- | prints JavaScript errors in the R console
| `hide_elem` | `elem` | hides an element
| `insert_adjacent_html` | `id`, `html`, `position` | create a new child element(s) to a parent element
| `inner_html` | `elem`, `string`, `delay` | change the inner html of an element
| `inner_text` | `elem`, `string`, `delay` | change the inner text of an element
| `print_elem` | `elem` | print an html element in the R console
| `refresh_page` |  --- | trigger a page refresh (`history.go(0)`)
| `remove_css` | `elem`, `css` | remove a css class from an element
| `remove_element` | `elem` | remove an element from the DOM
| `remove_element_attribute` | `elem`, `attr` | remove an attribute from an element
| `set_document_title` | `title`, `append` | change the title of the document
| `set_element_attribute` | `elem`, `attr`, `value` | update an attribute of an element
| `scroll_to` | `x`, `y`, `elem` | scroll to a position in a page or element (default: `0, 0` = top of document)
| `show_elem` | `elem` | show an element
| `toggle_css` | `elem`, `css` | toggle a css class
| `toggle_elem` | `elem` | toggle the state of an element (i.e., hide or show)

### Demo

You can now view a demo of this package by running the following function.

```r
browsertools::run_demo()
```

## Development

If you would like to modify the package's js files, you will need to install the following tools.

1. [Node and Npm](https://nodejs.org/en/). 
2. [Yarn](https://yarnpkg.com/getting-started/install)

This package also uses parceljs as the application bundler and a number of js packages. To install these tools, run the following command.

```bash
yarn install
```

To build javascript file, run the following command in the terminal.

```bash
yarn clean    # removes existing files
yarn build    # rebuilds js
```

Use the R script `dev/dev.R` for managing the package and the dev app for debugging/building new features.
