////////////////////////////////////////////////////////////////////////////////
// FILE: index.js
// AUTHOR: David Ruvolo
// CREATED: 2020-05-25
// MODIFIED: 2020-09-21
// PURPOSE: for building static assets
// DEPENDENCIES: see package.json
// STATUS: working
// COMMENTS: NA
////////////////////////////////////////////////////////////////////////////////
// BEGIN

import "./scss/index.scss";

// set document meta attributes that aren't available through Shiny
window.addEventListener("DOMContentLoaded", (e) => {
    const html = document.getElementsByTagName("html")[0];
    html.lang = "en";
    html.dir = "ltr";
}, { once: true });