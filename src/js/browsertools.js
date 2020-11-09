////////////////////////////////////////////////////////////////////////////////
// FILE: index.js
// AUTHOR: David Ruvolo
// CREATED: 2019-11-11
// MODIFIED: 2020-11-09
// PURPOSE: main js file for app
// DEPENDENCIES: NA
// STATUS: working
// COMMENTS: run yarn build to transpile
////////////////////////////////////////////////////////////////////////////////

// define new class
function browsertools(debug) {
    this.debug = typeof debug === "undefined" ? false : debug;
}

// send_error
// display error in the browser, R Server
// @param func name of where the error occurred
// @param error the error object
browsertools.prototype.send_error = function (func, error) {
    console.error(`Error in ${func}: ${error.name}\n${error.message}`)
    if (this.debug) {
        const err = {
            func: func,
            name: error.name,
            message: error.message
        }
        Shiny.setInputValue("browsertools_debug", JSON.stringify(err))
    }
}

// inherited functions
// exposed functions will be added via the shiny bind function
browsertools.prototype.console = Object.create(console);
browsertools.prototype.alert = Object.create(alert);

// add css
// @param elem element to select
// @param css name of the css class to remove
browsertools.prototype.add_css = function (elem, css) {
    try {
        document.querySelector(elem).classList.add(...css);
    } catch (e) {
        this.send_error("add_css", e)
    }
}

// hide_elem
// hide an element in the client
// @param elem a element selector
browsertools.prototype.hide_elem = function (elem) {
    try {
        document.querySelector(elem).setAttribute("hidden", "")
    } catch (e) {
        this.send_error("hide_elem", e)
    }
}

// set innerHTML
// @param elem a selector path
// @param content html content to render
// @param append if TRUE, content will be appened to current content
// @param delay time (ms) to delay before inserting content
browsertools.prototype.inner_html = function (elem, content, append, delay) {
    try {
        const el = document.querySelector(elem);
        const newContent = append ? el.innerHTML + content : content;
        if (delay) {
            setTimeout(function () {
                document.querySelector(elem).innerHTML = newContent;
            }, delay);
        } else {
            document.querySelector(elem).innerHTML = newContent;
        }
    } catch (e) {
        this.send_error("inner_html", e);
    }
}

// set inner text
// @param elem a selector path
// @param content content to render
// @param append if TRUE, content will be appened to current content
// @param delay time (ms) to delay before inserting content
browsertools.prototype.inner_text = function (elem, content, append, delay) {
    try {
        const el = document.querySelector(elem);
        const newContent = append ? el.innerText + content : content;
        if (delay) {
            setTimeout(function () {
                document.querySelector(elem).innerText = newContent;
            }, delay);
        } else {
            document.querySelector(elem).innerText = newContent;
        }
    } catch (e) {
        this.send_error("inner_text", e);
    }
}


// INSERT ADJACENT HTML
// @param id: An ID used to select an element
// @param content: an html string to insert
// @param position: location where to insert (beforebegin, etc.)
browsertools.prototype.insert_adjacent_html = function (id, content, position) {
    try {
        const parent = document.getElementById(id);
        parent.insertAdjacentHTML(position, content);
    } catch (e) {
        this.send_error("insert_adjacent_html", e);
    }
}

// print elem
// @param elem a selector path
browsertools.prototype.print_elem = function (elem) {
    try {
        const el = document.querySelector(elem).outerHTML;
        Shiny.setInputValue("print_elem_response", JSON.stringify(el));
    } catch (e) {
        this.send_error("print_elem", e);
    }
}

// refresh page
browsertools.prototype.refresh_page = function () {
    history.go(0);
}


// remove css
// @param elem an element selector path
// @param css a classname to remove
browsertools.prototype.remove_css = function (elem, css) {
    try {
        document.querySelector(elem).classList.remove(...css);
    } catch (e) {
        this.send_error("remove_css", e);
    }
}

// remove element
// @param elem a selector path
browsertools.prototype.remove_element = function (elem) {
    try {
        const el = document.querySelector(elem);
        el.parentNode.removeChild(el);
    } catch (e) {
        this.send_error("remove_element", e);
    }
}

// remove element attribute
// @param elem a selector path
// @param attr name of attribute to remove
browsertools.prototype.remove_element_attribute = function (elem, attr) {
    try {
        document.querySelector(elem).removeAttribute(attr);
    } catch (e) {
        this.send_error("remove_element_attribute", e);
    }
}

// set document title
// @param title a string to add to the title
// @param append if TRUE, the doc title will be appended
browsertools.prototype.set_document_title = function (title, append) {
    try {
        if (append) {
            document.title = document.title + title;
        } else {
            document.title = title;
        }
    } catch (e) {
        this.send_error("set_document_title", e);
    }
}

// set element attribute
// @param elem a selector path
// @param attr a name of an attribute
// @param value new value
browsertools.prototype.set_element_attribute = function (elem, attr, value) {
    try {
        document.querySelector(elem).setAttribute(attr, value);
    } catch (e) {
        this.send_error("set_element_attribute", e);
    }
}

// show elem
// @param elem a selector path
browsertools.prototype.show_elem = function (elem) {
    try {
        const el = document.querySelector(elem);
        el.removeAttribute("hidden");
    } catch (e) {
        this.send_error("show_elem", e);
    }
}

// SCROLL TO
// default usage will scroll to the top of the document
// @param x amount to scroll along the x axis (default: 0)
// @param y amount to scroll along the y axis (default: 0)
// @param elem an element to scroll to (optional: will override x/y)
browsertools.prototype.scroll_to = function (x, y, elem) {
    try {
        elem ? document.querySelector(elem).scrollIntoView() : window.scrollTo(x, y);
    } catch (e) {
        this.send_error("scroll_to", e);
    }
}

// TOGGLE CSS CLASS
// @param elem: an element to select (e.g., ID, class, tag, etc.)
// @param css: a css class to toggle
browsertools.prototype.toggle_css = function (elem, css) {
    try {
        const el = document.querySelector(elem);
        if (css.length > 1) {
            css.map(c => el.classList.toggle(c));
        } else {
            el.classList.toggle(css);
        }
    } catch (e) {
        this.send_error("toggle_css", e);
    }
}

// TOGGLE ELEMENT
// @param elem: an element to select (e.g., ID, class, tag, etc.)
browsertools.prototype.toggle_elem = function (elem) {
    try {
        let el = document.querySelector(elem);
        el.hasAttribute("hidden") ? this.show_elem(elem) : this.hide_elem(elem);
    } catch (e) {
        this.send_error("toggle_elem", e);
    }
}


// export
export default browsertools;