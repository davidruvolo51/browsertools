# shinytools

A collection of my favorite tools for building shiny applications

## About

This repository contains a couple of files: `index.js` and `js_handlers.R`. These files contain handlers for passing data between R and JavaScript (and back again). In the file `js_handlers.R` there are a series of functions that wrap around `session$sendCustomMessage`. Functions are stored in a single list to prevent namespace clogging and for ease of use. The corresponding JavaScript functions that receive the input from the shiny server can be found in the `index.js` file. All functions are written in vanilla js. 

## Use

To use the scripts in your shiny application, you create the `www` directory and clone the `index.js` into `www/`. Clone the `js_handlers.R` into the main directory or another location as desired.

**1. Load the `index.js` in the shiny ui.**

Somewhere before the end of your ui code, enter the following lines.

```r
tags$script(type="text/javascript", src="index.js")
```

**2. Load the `js_handlers.R` file**

Load the R file. Make sure you use `local=TRUE` to use the session object automatically.

```r
source("js_handlers.R", local = TRUE)
```

As all functions are stored in the list object `js`, you can call functions like:

```r
js$addCSS(elem, css)
```


## Functions

The following functions are available. Make sure all function calls start with `js$`.

| function              | arguments | description | 
| :-------              | :-------- | :---------- |
| `addCSS`              | `elem`, `css` | add a css class to an element
| `clearInputs`         | `elems` | set input values to `value = ""`. elems is an array or single item
| `consoleLog`          | `value`, `asDir=TRUE` | log values to the browser console
| `hideElem`            | `id`| hide an element
| `innerHTML`           | `elem`, `string` | write values to an element
| `refreshPage`         |  --- | trigger a page refresh (`history.go(0)`)
| `removeCSS`           | `elem`, `css` | remove a css class from an element
| `scrollToTop`         | --- | scroll to top of page
| `showElem`            | `id` | show an element
| `setElementAttribute` | `elem`, `attr`, `value` | send values to a named attribute of an element
| `toggleCSS`           | `elem`, `css` | toggle a css class