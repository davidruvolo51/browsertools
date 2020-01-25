# shinytools

A collection of my favorite tools for building shiny applications bundled into a tidy package. This repository contains a couple of files: `index.js` and `js_handlers.R`. These files contain handlers for passing data between R and JavaScript (and back again). In the file `js_handlers.R` there are a series of functions that wrap around `session$sendCustomMessage`. Functions are stored in a single list to prevent namespace clogging and for ease of use. The corresponding JavaScript functions that receive the input from the shiny server can be found in the `index.js` file. All functions are written in vanilla js and transpiled using `babel` and `babel-minify`

## Use

Install the shinytools package. Like other shiny packages, you must load the assets at the top of the shiny app.

```r
shinytools::use_shinytools()
```

After doing so, you can use the functions in the server as normal R functions

```r
server <- function(input, output, session) {
    console_log(x = mtcars, asDir = F)
}
```

For a complete list of functions and examples, please refer to the [wiki](https://github.com/davidruvolo51/shinytools/wiki).