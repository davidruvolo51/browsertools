////////////////////////////////////////////////////////////////////////////////
// FILE: index.js
// AUTHOR: David Ruvolo
// CREATED: 2019-11-11
// MODIFIED: 2020-05-24
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

////////////////////////////////////////

// ADD CSS CLASS
// @param elem: element to select (i.e., ID, class, tag, etc.)
// @param css: name of css class to remove
function add_css(elem, css) {
    try {
        document.querySelectorAll(elem).forEach(el => el.classList.add(css));
    } catch (e) {
        send_error("add_css", e)
    }
}


// register
Shiny.addCustomMessageHandler("add_css", function (value) {
    add_css(value.elem, value.css, value.debug);
});

////////////////////////////////////////

// ALERT
// @oaram message: an message to display
// register
Shiny.addCustomMessageHandler("alert", function(value) {
    alert(value.message);
});

////////////////////////////////////////

// LOG AN ERROR TO THE CONSOLE
// @param value: a message
function console_error(value) {
    console.error(value)
}

Shiny.addCustomMessageHandler("console_error", function (value) {
    console_error(value);
});

////////////////////////////////////////

// LOG SOMETHING TO THE CONSOLE
// @param value: a message
function console_log(message, expand) {
    expand ? console.dir(message) : console.log(message);
}

Shiny.addCustomMessageHandler("console_log", function (value) {
    console_log(value.message, value.expand);
});

////////////////////////////////////////

// CONSOLE_TABLE
// @param value: an object to be printed (must be transformed first)
function console_table(value) {
    console.table(value)
}

Shiny.addCustomMessageHandler("console_table", function (value) {
    console_table(value);
});

////////////////////////////////////////

// CONSOLE WARN
// @param value: a message
function console_warn(value) {
    console.warn(value);
}

Shiny.addCustomMessageHandler("console_warn", function (value) {
    console_warn(value);
});

////////////////////////////////////////

// HIDE ELEM
// @param elem: an element to select (e.g., ID, class, tag, etc.)
// @param css: a class name that is used to hide an element (default class is: browsertools-hidden; see css file and R script)
function hide_elem(elem, css) {
    try {
        document.querySelector(elem).forEach(el => {
            el.classList.add(css);
            el.setAttribute("aria-hidden", "true");
        });
    } catch (e) {
        send_error("hide_elem", e);
    }
}

Shiny.addCustomMessageHandler("hide_elem", function (value) {
    hide_elem(value.elem, value.css);
});

////////////////////////////////////////

// SET INNERHTML
// @param elem: an element to select
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

// register
Shiny.addCustomMessageHandler("inner_html", function (value) {
    inner_html(value.elem, value.string, value.delay)
});

////////////////////////////////////////

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

// register
Shiny.addCustomMessageHandler("inner_text", function (value) {
    inner_text(value.elem, value.string, value.delay);
});

////////////////////////////////////////

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

// register
Shiny.addCustomMessageHandler("insert_adjacent_html", function (value) {
    insert_adjacent_html(value.id, value.html, value.position)
});

////////////////////////////////////////

// PRINT ELEM
// @param elem: select an print an HTML element in the R Console
function print_elem(elem) {
    try {
        const el = document.querySelector(elem).outerHTML;
        Shiny.setInputValue("print_elem_response", JSON.stringify(el));
    } catch (e) {
        send_error("print_elem", e);
    }
}

// register
Shiny.addCustomMessageHandler("print_elem", function(value) {
    print_elem(value.elem);
});

////////////////////////////////////////

// REFRESH PAGE
function refresh_page(value) {
    history.go(0);
}

// register
Shiny.addCustomMessageHandler("refresh_page", function (value) {
    refresh_page(value);
});

////////////////////////////////////////

// REMOVE CSS CLASS
// @param elem: an element to select (i.e., ID, class, tag, etc.)
// @param css: a css classname to remove from an element
function remove_css(elem, css) {
    try {
        document.querySelector(elem).forEach(el => el.classList.remove(css)); 
    } catch (e) {
        send_error("remove_css", e);
    }
}

// register
Shiny.addCustomMessageHandler("remove_css", function (value) {
    remove_css(value.elem, value.css);
});

////////////////////////////////////////

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

// register
Shiny.addCustomMessageHandler("remove_element", function(value) {
    remove_element(value.elem);
});

////////////////////////////////////////

// REMOVE ELEMENT ATTRIBUTE
// @param elem: an element to select
// @param attr: the name of the attribute to remove
function remove_element_attribute(elem, attr) {
    try {
        document.querySelectorAll(elem).forEach(el => el.removeAttribute(attr));
    } catch (e) {
        send_error("remove_element_attribute", e);
    }
}

// register
Shiny.addCustomMessageHandler("remove_element_attribute", function (value) {
    remove_element_attribute(value.elem, value.attr)
});

////////////////////////////////////////

// SET ELEMENT ATTRIBUTES
// @param elem: an element to select
// @param attr: the name of the attribute to update
// @param value: the new value
function set_element_attribute(elem, attr, value) {
    try {
        document.querySelectorAll(elem).forEach(el => el.setAttribute(attr, value));
    } catch (e) {
        send_error("set_element_attribute", e);
    }
}

// register
Shiny.addCustomMessageHandler("set_element_attribute", function (value) {
    set_element_attribute(value.elem, value.attr, value.value);
});

////////////////////////////////////////

// SHOW ELEM (SHOW / HIDE)
// @param elem: an element to select (e.g., ID, class, tag, etc.)
// @para css: css class that shows an element (see hide elem)
function show_elem(elem, css) {
    try {
        document.querySelectorAll(elem).forEach(el => {
            el.classList.remove(css);
            el.removeAttribute("aria-hidden");
        });
    } catch (e) {
        send_error("show_elem", e);
    }
}

// register
Shiny.addCustomMessageHandler("show_elem", function (value) {
    show_elem(value.elem, value.css);
});

////////////////////////////////////////

// SCROLL TO
// scroll to a specific point of a document
// default usage will scroll to the top of the document
// @param x amount to scroll along the horizontal axis
function scroll_to(x, y) {
    window.scrollTo(x, y);
}

// register
Shiny.addCustomMessageHandler("scroll_to", function (value) {
    scroll_to_top(value.x, value.y);
});

////////////////////////////////////////

// TOGGLE CSS CLASS
// @param elem: an element to select (e.g., ID, class, tag, etc.)
// @param css: a css class to toggle
function toggle_css(elem, css) {
    try {
        document.querySelectorAll(elem).forEach(el => el.classList.toggle(css));
    } catch (e) {
        send_error("toggle_css", e);
    }
}

// register
Shiny.addCustomMessageHandler("toggle_css", function (value) {
    toggle_css(value.elem, value.css);
});