# shinytools

A collection of my favorite tools for building shiny applications

## About

This repository contains a couple of files: `index.js` and `js_handlers.R`. These files contain handlers for passing data between R and JavaScript (and back again). In the file `js_handlers.R` there are a series of functions that wrap around `session$sendCustomMessage`. Functions are stored in a single list to prevent namespace clogging and for ease of use. The corresponding JavaScript functions that receive the input from the shiny server can be found in the `index.js` file. All functions are written in vanilla js. 

## Use

To use the scripts in your shiny application, you create the `www` directory and clone the `index.js` into `www/`. Clone the `js_handlers.R` into the main directory or another location as desired.

**1. Load the `index.js` in the shiny ui.**

Somewhere before the end of your ui code, enter the following lines.

```r
tags$script(src="index.js")
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
| `clearInputs`         | `elem` | set input values to `value = ""`. elems is an array or single item
| `consoleLog`          | `value`, `asDir=TRUE` | log values to the browser console
| `hideElem`            | `id`| hide an element
| `innerHTML`           | `elem`, `string`, `delay` | write values to an element. 
| `refreshPage`         |  --- | trigger a page refresh (`history.go(0)`)
| `removeCSS`           | `elem`, `css` | remove a css class from an element
| `scrollToTop`         | --- | scroll to top of page
| `showElem`            | `id` | show an element
| `setElementAttribute` | `elem`, `attr`, `value` | send values to a named attribute of an element
| `toggleCSS`           | `elem`, `css` | toggle a css class


### addCSS

This function applies a class name to a specific element. This function uses `querySelector` to allow for `id` or `class` names. If using `ids` use, `#` + `someid`.

```r
js$addCSS(elem = "#sidebar", css = "classname");
```

### clearInputs

This function sets the value text-based inputs to `""` (nothing). Enter one or more elements.

```r
js$clearInputs(elem = "#username")
```

### consoleLog

This function outputs a value to the browser's console. By default, the console method is `dir` this will expanded nested elements. Use `FALSE` if needed.

```r
js$consoleLog(value = iris)
```


### hideElem

This function hides an element using `display: none` and sets the attribute `hidden`. The JS function uses `querySelector` so you can enter an id or a class name.

In the css file assign a class name `hidden` associated with the element you want to show/hide.

```css
/* css */
#sidebar.hidden {
    display: block;
    background-color: blue;
    transition: all 1s ease-in-out;
}
```

```r
# in r
js$hideElem(elem = "#sidebar")
```

### innerHTML

The function `innerHTML` update the content of an element. You can use either an id or class name. Use the `delay` attribute to add a pause before updating content. This is useful content rendered server-side. The `delay` argument is time in milliseconds.

```r
js$innerHTML(elem = "#sidebar", string = "Hello, world!", delay = 50)
```

### refreshPage

When calld in the server, this will refresh the application. 

```r
js$refreshPage()
```

### removeCSS

This function removes a class from an element (by id or class name).

```r
js$removeCSS(elem = "#sidebar", css = "someclass")
```

### scrollToTop

This function scrolls to the top of the page.

```r
js$scrollToTop()
```

### showElem

This function shows an element by id or class name. This function works be removing a class name `hidden` rather than modifying the display properties. In the css file assign a class name `hidden` associated with the element you want to show/hide.

```css
/* css */
#sidebar.hidden {
    display: block;
    background-color: blue;
    transition: all 1s ease-in-out;
}
```

```r
# in R
js$showElem(elem = "#sidebar")
```

### setElementAttribute

Use this function to modify an attribute of an element.

```r
js$setElementAttribute(elem = "#sidebar", attr="data-myattr", value = "hello world")
```

### toggleCSS

This function toggles a specific class of an element.

```r
js$toggleCSS(elem = "#sidebar", css = "someclass")
```
