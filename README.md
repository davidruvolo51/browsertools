# browsertools

This package contains a series of functions for running javascript functions in shiny. These functions are wrappers for custom message handlers for routine DOM manipulation within shiny server. All JavaScript functions were written in vanilla JS and transpiled using babel.js making this package ideal for custom shiny applications.

See the [wiki](https://github.com/davidruvolo51/browsertools/wiki) for more information.


## Use

You can use any of the following functions in the shiny server.

| function              | arguments | description | 
| :-------              | :-------- | :---------- |
| `use_browsertools` | --- | loads the browsertool dependencies into your shiny app (required)
| `debug` | --- | prints JavaScript errors in the R console
| `add_css` | `elem`, `css` | add a css class to an element
| `as_js_object` | `x` | a data.frame to convert to javascript object
| `console_error` | `message` | send an error message to the console
| `console_log` | `message` | log values to the browser console
| `console_table` | `data` | a json object to display in the console; use `as_js_object` function to convert your data before passing into the function
| `console_warn` | `message` | send a warning message to the console
| `hide_elem` | `elem`, `css` | hides an element by adding a class by name or `hidden` 
| `insert_adjacent_html` | `id`, `html`, `position` | create a new child element(s) to a parent element
| `inner_html` | `elem`, `string`, `delay` | change the inner html of an element
| `inner_text` | `elem`, `string`, `delay` | change the inner text of an element
| `refresh_page` |  --- | trigger a page refresh (`history.go(0)`)
| `remove_css` | `elem`, `css` | remove a css class from an element
| `remove_element` | `elem` | remove an element from the DOM
| `remove_element_attribute` | `elem`, `attr` | remove an attribute from an element
| `set_element_attribute` | `elem`, `attr`, `value` | update an attribute of an element 
| `scroll_to_top` | --- | scroll to top of page
| `show_elem` | `elem`, `css` | show an element by removing a class name or `hidden`
| `toggle_css` | `elem`, `css` | toggle a css class


Call `user_browsertools` at the top of the UI (this loads the package dependencies). In the shiny server, call any function that you like. See the [wiki](https://github.com/davidruvolo51/browsertools/wiki) for more information and examples.

```r
ui <- tagList(
    browsertools::use_browsertools()
    ...
)
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