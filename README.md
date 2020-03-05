# browsertools

A collection of my favorite tools for building shiny applications bundled into a tidy package. This repository contains a couple of files: `index.js` and `js_handlers.R`. These files contain handlers for passing data between R and JavaScript (and back again). In the file `js_handlers.R` there are a series of functions that wrap around `session$sendCustomMessage`.  The JavaScript functions that receive the input from the shiny server can be found in the `inst/assets/src/index.js` file. All functions are written in vanilla js and transpiled using `babel` and `babel-minify`

## Use

Install the shinytools package. Like other shiny packages, you must load the assets at the top of the shiny app.

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

For a complete list of functions and examples, please refer to the [wiki](https://github.com/davidruvolo51/browsertools/wiki).

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