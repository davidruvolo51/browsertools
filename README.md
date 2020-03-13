# browsertools

A collection of my favorite tools for building shiny applications bundled into a tidy package. This repository contains a couple of files: `index.js` and `js_handlers.R`. These files contain handlers for passing data between R and JavaScript (and back again). In the file `js_handlers.R` there are a series of functions that wrap around `session$sendCustomMessage`.  The JavaScript functions that receive the input from the shiny server can be found in the `inst/assets/src/index.js` file. All functions are written in vanilla js and transpiled using `babel` and `babel-minify`

## Use

The following functions are available in this packge. For more information and examples, please refer to the [wiki](https://github.com/davidruvolo51/browsertools/wiki).

| function              | arguments | description | 
| :-------              | :-------- | :---------- |
| [`use_browsertools`](#use_browsertools) | --- | loads the browsertool dependencies into your shiny app (required)
| [`add_css`](#add_css) | `elem`, `css` | add a css class to an element
| [`as_js_object`](#as_js_object) | `x` | a data.frame to convert to javascript object
| [`console_log`](#console_log) | `x` | log values to the browser console
| [`console_table`](#console_table) | `x` | a json object to display in the console; use `as_js_object` function to convert your data before passing into the function
| [`hide_elem`](#hide_elem) | `elem`, `css` | hides an element by adding a class by name or `hidden` 
| [`inner_html`](#inner_html) | `elem`, `string`, `delay` | write values to an element. 
| [`refresh_page`](#refresh_page) |  --- | trigger a page refresh (`history.go(0)`)
| [`remove_css`](#remove_css) | `elem`, `css` | remove a css class from an element
| [`remove_element`](#remove_element) | `elem` | remove an element from the DOM
| [`remove_element_attribute`](#remove_element_attribute) | `elem`, `attr` | remove an attribute from an element
| [`set_element_attribute`](#set_element_attribute) | `elem`, `attr`, `value` | update an attribute of an element 
| [`scroll_to_top`](#scroll_to_top) | --- | scroll to top of page
| [`show_elem`](#show_elem) | `elem`, `css` | show an element by removing a class name or `hidden`
| [`toggle_css`](#toggle_css) | `elem`, `css` | toggle a css class


Like other shiny packages, you must load the assets at the top of the shiny app.

```r
ui <- tagList(
    browsertools::use_browsertools()
    ...
)
```

After doing so, you can use the functions in the server as normal R functions

```r
server <- function(input, output, session) {
    console_log(x = mtcars, asDir = F)
}
```

## Development

You will need to install [Node and Npm](https://nodejs.org/en/). You can use npm as the package manager, but I've integrated [yarn](https://yarnpkg.com/getting-started/install). Once all of the command line tools are installed, install of all of the development dependencies listed in the `package.json` file.

```bash
yarn install
```

To build the javascript files, run the following commands in the terminal.

```bash
yarn clean    # removes previous verion
yarn build    # builds new file
```

To build the R package, run the following command in the terminal.

```bash
yarn package
```