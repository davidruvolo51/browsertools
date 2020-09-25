////////////////////////////////////////////////////////////////////////////////
// FILE: webpack.prod.js
// AUTHOR: David Ruvolo
// CREATED: 2020-09-25
// MODIFIED: 2020-09-25
// PURPOSE: configuration for production env
// DEPENDENCIES: see below + common
// STATUS: working
// COMMENTS: NA
////////////////////////////////////////////////////////////////////////////////

// load
const TerserPlugin = require("terser-webpack-plugin");

// config
module.exports = {
    mode: "production",
    optimization: {
        minimize: true,
        minimizer: [
            new TerserPlugin()
        ]
    },
}