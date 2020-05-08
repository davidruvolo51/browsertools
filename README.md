# browsertools

This package contains a series of functions for running javascript functions in shiny. These functions are wrappers for custom message handlers for routine DOM manipulation within shiny server. All JavaScript functions were written in vanilla JS and transpiled using babel.js making this package ideal for custom shiny applications.

See the [wiki](https://github.com/davidruvolo51/browsertools/wiki) for more information.


## Use

Available functions are listed in the table below.

| function              | arguments | description | 
| :-------              | :-------- | :---------- |
| `use_browsertools` | --- | loads the browsertool dependencies into your shiny app (required)
| `add_css` | `elem`, `css` | add a css class to an element
| `as_js_object` | `x` | a data.frame to convert to javascript object
| `console_error` | `message` | send an error message to the console
| `console_log` | `message` | log values to the browser console
| `console_table` | `data` | a json object to display in the console; use `as_js_object` function to convert your data before passing into the function
| `console_warn` | `message` | send a warning message to the console
| `hide_elem` | `elem`, `css` | hides an element by adding a class by name or `hidden` 
| `insert_adjacent_html` | `id`, `html`, `position` | create a new child element(s) to a parent element
| `inner_html` | `elem`, `string`, `delay` | write values to an element. 
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

If you would like to modify the package's css or js files, you will need to install [Node and Npm](https://nodejs.org/en/). This package also uses parceljs as the application bundler and a number of js packages. To install these tools, run the following command.

```bash
npm install
```

To build the and css and javascript files, run the following commands in the terminal.

```bash
npm run clean    # removes existing files
npm run build    # builds css and js files
```

Alternatively, you can rebuild each asset independently.

```bash
npm run babel
npm run sass
```

When all changes are made and the css/js files are built, you can build the package using the following commands.

```bash
npm run uninstall    # uninstalls pkg
npm run document     # builds pkg documentation
npm run package      # builds and installs pkg
```