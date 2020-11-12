////////////////////////////////////////////////////////////////////////////////
// FILE: index.js
// AUTHOR: David Ruvolo
// CREATED: 2020-11-07
// MODIFIED: 2020-11-11
// PURPOSE: entry point
// DEPENDENCIES: NA
// STATUS: in.progress
// COMMENTS: NA
////////////////////////////////////////////////////////////////////////////////

// import
import get_attribs from "./js/get_attribs";
import Browsertools from "./js/browsertools";

// create new browsertools object
var bt = new Browsertools();

// handler: debug option
Shiny.addCustomMessageHandler("browsertools_debug", (d) => {
    bt.debug = d.debug;
});

// handler: add_css
// @param elem a selector path
// @param css an array of css classes to add
Shiny.addCustomMessageHandler("add_css", (d) => {
    bt.add_css(d.elem, d.css);
});

// handler: console_error
// @param d a message to display
Shiny.addCustomMessageHandler("console_error", (d) => {
    bt.console.error(d);
});

// handler: console_log
// @param d a message to display
Shiny.addCustomMessageHandler("console_log", (d) => {
    bt.console.log(d);
});

// handler: console_table
// @param d a data object to display
Shiny.addCustomMessageHandler("console_table", (d) => {
    bt.console.table(d);
});

// handler: console_warn
// @param d a message to display
Shiny.addCustomMessageHandler("console_warn", (d) => {
    bt.console.warn(d)
});

// handler: hide_elem
// @param elem a selector path
Shiny.addCustomMessageHandler("hide_elem", (d) => {
    bt.hide_elem(d.elem);
});

// handler: inner_html
// @param elem a selector path
// @param content content to insert
// @param append if TRUE, content will be append to current content
// @param delay if present, content will be inserted after a slight pause (ms)
Shiny.addCustomMessageHandler("inner_html", (d) => {
    bt.inner_html(d.elem, d.content, d.append, d.delay);
});

// handler: inner_text
// @param elem a selector path
// @param content content to insert
// @param append if TRUE, content will be append to current content
// @param delay if present, content will be inserted after a slight pause (ms)
Shiny.addCustomMessageHandler("inner_text", (d) => {
    bt.inner_text(d.elem, d.content, d.append, d.delay);
});

// handler: insert_adjacent_html
// @param id an ID selector path
// @param content content to insert
// @param position location to insert content
Shiny.addCustomMessageHandler("insert_adjacent_html", (d) => {
    bt.insert_adjacent_html(d.id, d.content, d.position);
});

// handler: print_elem
// @param elem a selector path
Shiny.addCustomMessageHandler("print_elem", (d) => {
    bt.print_elem(d.elem);
});

// handler: refresh_page
Shiny.addCustomMessageHandler("refresh_page", (d) => {
    bt.refresh_page();
});

// handler: remove_css
// @param elem a selector path
// @param css an array of css classes to remove
Shiny.addCustomMessageHandler("remove_css", (d) => {
    bt.remove_css(d.elem, d.css);
});

// handler: remove_element
// @param elem a selector path
Shiny.addCustomMessageHandler("remove_element", (d) => {
    bt.remove_element(d.elem);
});

// handler: remove_element_attribute
// @param elem a selector path
// @param attr a named attribute
Shiny.addCustomMessageHandler("remove_element_attribute", (d) => {
    bt.remove_element_attribute(d.elem, d.attr);
});

// handler: set_document_title
// @param title a document title
// @param append if true, title will be appended to current title
Shiny.addCustomMessageHandler("set_document_title", (d) => {
    bt.set_document_title(d.title, d.append);
});

// handler: set_element_attribute
// @param elem a selector path
// @param attr a named attribute
// @param value new value to assign the target attribute
Shiny.addCustomMessageHandler("set_element_attribute", (d) => {
    bt.set_element_attribute(d.elem, d.attr, d.value);
});

// handler: show_elem
// @param elem a selector path
Shiny.addCustomMessageHandler("show_elem", (d) => {
    bt.show_elem(d.elem);
});

// handler: scroll_to
// @param x horizontal distance from top-left
// @param y vertical distance from top-left
// @param elem a selector path (optional)
Shiny.addCustomMessageHandler("scroll_to", (d) => { 
    bt.scroll_to(d.x, d.y, d.elem)
});

// handler: toggle_css
// @param elem a selector path
// @param css an array of css classes to toggle
Shiny.addCustomMessageHandler("toggle_css", (d) => {
    bt.toggle_css(d.elem, d.css);
});

// handler: toggle_elem
// @param elem a selector path
Shiny.addCustomMessageHandler("toggle_elem", (d) => {
    bt.toggle_elem(d.elem);
});

// custom input bindings
Shiny.inputBindings.register(get_attribs);


