////////////////////////////////////////////////////////////////////////////////
// FILE: index.js
// AUTHOR: David Ruvolo
// CREATED: 2019-11-11
// MODIFIED: 2020-05-21
// PURPOSE: main js file for app
// DEPENDENCIES: NA
// STATUS: working
// COMMENTS: run yarn build to transpile
////////////////////////////////////////////////////////////////////////////////
// DEFINE FUNCTIONS

// Set Package Options
let browsertools = {
    debug: false
}

// watch for options
Shiny.addCustomMessageHandler("browsertools_debug", function (value) {
    browsertools.debug = value.debug;
});

////////////////////////////////////////

// SEND ERROR MESSAGE
// This function is used by all functions in the pkg. By default, 
// all options will log values to the browser console. However,
// there are case uses for developing shiny apps in the viewer pane.
// The dev tools aren't the best in this situation, so it would be nice
// if JavaScript errors could be viewed in the R console. The R function
// `debug` sends a debug = true and updates the local value browsertools.debug
// If the function is not called, then the value is false.
// @param func: name of the function called
// @param e: the error object
function send_error(func, e) {
    console.log(e);
    if (browsertools.debug) {
        const err = {
            func: func,
            name: e.name,
            message: e.message
        }
        Shiny.setInputValue("browsertools_debug", JSON.stringify(err));
    }
}

// ADD CSS CLASS
// @param elem: element to select (i.e., ID, class, tag, etc.)
// @param css: name of css class to remove
function add_css(elem, css) {
    try {
        document.querySelector(elem).classList.add(css);
    } catch (e) {
        send_error("add_css", e)
    }
}

// LOG AN ERROR TO THE CONSOLE
// @param value: a message
function console_error(value) {
    console.error(value)
}

// LOG SOMETHING TO THE CONSOLE
// @param value: a message
function console_log(value) {
    console.log(value);
}

// CONSOLE_TABLE
// @param value: an object to be printed (must be transformed first)
function console_table(value) {
    console.table(value)
}

// CONSOLE WARN
// @param value: a message
function console_warn(value) {
    console.warn(value);
}

// HIDE ELEM
// @param elem: an element to select (e.g., ID, class, tag, etc.)
// @param css: a class name that is used to hide an element (default class is: browsertools-hidden; see css file and R script)
function hide_elem(elem, css) {
    try {
        document.querySelector(elem).classList.add(css);
    } catch (e) {
        send_error("hide_elem", e);
    }
}

// SET INNERHTML
// @param elem: an element to select (e.g., ID, class, tag, etc.)
// @param string: content to add to element
// @param delay: time (ms) to wait before inserting content
function inner_html(elem, string, delay) {
    try {
        if (delay) {
            setTimeout(function () {
                document.querySelector(elem).innerHTML = string;
            }, delay);
        } else {
            document.querySelector(elem).innerHTML = string;
        }
    } catch (e) {
        send_error("inner_html", e)
    }
}

// SET INNERTEXT
// @param elem: an element to select (e.g., ID, class, tag, etc.)
// @param string: content to add
// @param delay: time (ms) to wait before inserting content
function inner_text(elem, string, delay) {
    try {
        if (delay) {
            setTimeout(function () {
                document.querySelector(elem).innerText = string;
            }, delay);
        } else {
            document.querySelector(elem).innerText = string;
        }
    } catch (e) {
        send_error("inner_text", e)
    }
}

// INSERT ADJACENT HTML
// @param id: An ID used to select an element
// @param html: an html string to insert
// @param position: location where to insert (beforebegin, etc.)
function insert_adjacent_html(id, html, position) {
    try {
        const parent = document.getElementById(id);
        parent.insertAdjacentHTML(position, html);
    } catch (e) {
        send_error("insert_adjacent_html", e);
    }
}

// REFRESH PAGE
function refresh_page(value) {
    history.go(0);
}

// REMOVE CSS CLASS
// @param elem: an element to select (i.e., ID, class, tag, etc.)
// @param css: a css classname to remove from an element
function remove_css(elem, css) {
    try {
        document.querySelector(elem).classList.remove(css);
    } catch (e) {
        send_error("remove_css", e);
    }
}

// REMOVE ELEMENT
// @param elem: an element to select (e.g., ID, class, tag, etc.)
function remove_element(elem) {
    try {
        const el = document.querySelector(elem);
        el.parentNode.removeChild(el);
    } catch (e) {
        send_error("remove_element", e);
    }
}

// REMOVE ELEMENT ATTRIBUTE
// @param elem: an element to select
// @param attr: the name of the attribute to remove
function remove_element_attribute(elem, attr) {
    try {
        document.querySelector(elem).removeAttribute(attr);
    } catch (e) {
        send_error("remove_element_attribute", e);
    }
}

// SET ELEMENT ATTRIBUTES
// @param elem: an element to select
// @param attr: the name of the attribute to update
// @param value: the new value
function set_element_attribute(elem, attr, value) {
    try {
        document.querySelector(elem).setAttribute(attr, value);
    } catch (e) {
        send_error("set_element_attribute", e);
    }
}

// SHOW ELEM (SHOW / HIDE)
// @param elem: an element to select (e.g., ID, class, tag, etc.)
// @para css: css class that shows an element (see hide elem)
function show_elem(elem, css) {
    try {
        document.querySelector(elem).classList.remove(css);
    } catch (e) {
        send_error("show_elem", e);
    }
}

// SCROLL TO TOP OF PAGE
function scroll_to_top(value) {
    window.scrollTo(0, 0);
}

// TOGGLE CSS CLASS
// @param elem: an element to select (e.g., ID, class, tag, etc.)
// @param css: a css class to toggle
function toggle_css(elem, css) {
    try {
        document.querySelector(elem).classList.toggle(css);
    } catch (e) {
        send_error("toggle_css", e);
    }
}

////////////////////////////////////////
// register modals
Shiny.addCustomMessageHandler("add_css", function (value) {
    add_css(value.elem, value.css, value.debug);
});

Shiny.addCustomMessageHandler("console_error", function (value) {
    console_error(value);
});

Shiny.addCustomMessageHandler("console_log", function (value) {
    console_log(value);
});

Shiny.addCustomMessageHandler("console_table", function (value) {
    console_table(value);
});

Shiny.addCustomMessageHandler("console_warn", function (value) {
    console_warn(value);
});

Shiny.addCustomMessageHandler("hide_elem", function (value) {
    hide_elem(value.elem, value.css);
});

Shiny.addCustomMessageHandler("inner_html", function (value) {
    inner_html(value.elem, value.string, value.delay)
});

Shiny.addCustomMessageHandler("inner_text", function (value) {
    inner_text(value.elem, value.string, value.delay);
});

Shiny.addCustomMessageHandler("insert_adjacent_html", function (value) {
    insert_adjacent_html(value.id, value.html, value.position)
});

Shiny.addCustomMessageHandler("refresh_page", function (value) {
    refresh_page(value);
});

Shiny.addCustomMessageHandler("remove_css", function (value) {
    remove_css(value.elem, value.css);
});

Shiny.addCustomMessageHandler("remove_element", function (value) {
    remove_element(value.elem)
});

Shiny.addCustomMessageHandler("remove_element_attribute", function (value) {
    remove_element_attribute(value.elem, value.attr)
});

Shiny.addCustomMessageHandler("scroll_to_top", function (value) {
    scroll_to_top(value);
});

Shiny.addCustomMessageHandler("set_element_attribute", function (value) {
    set_element_attribute(value.elem, value.attr, value.value);
});

Shiny.addCustomMessageHandler("show_elem", function (value) {
    show_elem(value.elem, value.css);
});

Shiny.addCustomMessageHandler("toggle_css", function (value) {
    toggle_css(value.elem, value.css);
});