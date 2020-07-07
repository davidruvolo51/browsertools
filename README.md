<!-- badges: start -->
[![Build Status](https://travis-ci.com/davidruvolo51/browsertools.svg?branch=prod)](https://travis-ci.com/davidruvolo51/browsertools)

[![R build status](https://github.com/davidruvolo51/browsertools/workflows/R-CMD-check/badge.svg)](https://github.com/davidruvolo51/browsertools/actions)
<!-- badges: end -->

# browsertools

This package contains a series of functions for running javascript functions in shiny. These functions are wrappers for custom message handlers for routine DOM manipulation within shiny server. All JavaScript functions were written in vanilla JS and transpiled using babel.js.

See the [wiki](https://github.com/davidruvolo51/browsertools/wiki) for more information.

## Install

You can install `browsertools` in R using the following command.

```r
install.packages("devtools")
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

This package offers the following functions. With the exception of the `use_browsertools` and `hidden`, these functions are designed to run within the shiny server.

### Shiny UI

| function | arguments | description | 
| :------- | :-------- | :---------- |
| `use_browsertools` | --- | loads the browsertool dependencies into your shiny app (required)
| `enable_attributes` | --- | allows you to access the html attributes of an element in the shiny server; Element must have an ID 
| `hidden` | `...`, `css` | Hide elements by default

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
| `hide_elem` | `elem`, `css` | hides an element by adding a class by name or `hidden` 
| `insert_adjacent_html` | `id`, `html`, `position` | create a new child element(s) to a parent element
| `inner_html` | `elem`, `string`, `delay` | change the inner html of an element
| `inner_text` | `elem`, `string`, `delay` | change the inner text of an element
| `print_elem` | `elem` | print an html element in the R console
| `refresh_page` |  --- | trigger a page refresh (`history.go(0)`)
| `remove_css` | `elem`, `css` | remove a css class from an element
| `remove_element` | `elem` | remove an element from the DOM
| `remove_element_attribute` | `elem`, `attr` | remove an attribute from an element
| `set_element_attribute` | `elem`, `attr`, `value` | update an attribute of an element 
| `scroll_to` | `x`, `y` | scroll to a position in a page (default: `0, 0` = top of document)
| `show_elem` | `elem`, `css` | show an element by removing a class name or `hidden`
| `toggle_css` | `elem`, `css` | toggle a css class
| `toggle_elem` | `elem`, `css` | toggle the visibility of an element

### Demo

You can now view a demo of this package by running the following function.

```r
browsertools::run_demo()
```

## Development

If you would like to modify the package's css or js files, you will need to install the following tools.

1. [Node and Npm](https://nodejs.org/en/). 
2. [Yarn](https://yarnpkg.com/getting-started/install)

This package also uses parceljs as the application bundler and a number of js packages. To install these tools, run the following command.

```bash
yarn install
```

To build the and css and javascript files, run the following commands in the terminal.

```bash
yarn clean    # removes existing files
yarn build    # builds css and js files
```

Alternatively, you can rebuild each asset independently.

```bash
yarn js
yarn sass
```

When all changes are made and the css/js files are built, you can build the package using the following commands.

```bash
yarn uninstall    # uninstalls pkg
yarn document     # builds pkg documentation
yarn package      # builds and installs pkg
```