////////////////////////////////////////////////////////////////////////////////
// FILE: index.js
// AUTHOR: David Ruvolo
// CREATED: 2019-11-11
// MODIFIED: 2020-03-24
// PURPOSE: main js file for app
// DEPENDENCIES: NA
// STATUS: working
// COMMENTS: NA
////////////////////////////////////////////////////////////////////////////////
// DEFINE FUNCTIONS
(function () {

    // ADD CSS CLASS
    function add_css(elem, css) {
        const el = document.querySelector(elem);
        el.classList.add(css);
    }

    // LOG AN ERROR TO THE CONSOLE
    function console_error(value) {
        console.error(value)
    }

    // LOG SOMETHING TO THE CONSOLE
    function console_log(value) {
        console.log(value);
    }

    // CONSOLE_TABLE
    function console_table(value) {
        console.table(value)
    }

    // CONSOLE WARN
    function console_warn(value) {
        console.warn(value);
    }

    // HIDE ELEM
    function hide_elem(elem, css) {
        const el = document.querySelector(elem);
        el.classList.add(css);
    }

    // INSERT ADJACENT HTML
    function insert_adjacent_html(id, html, position) {
        const parent = document.getElementById(id);
        parent.insertAdjacentHTML(position, html);
    }
    
    // SET INNERHTML
    function inner_html(elem, string, delay) {
        if (delay) {
            setTimeout(function () {
                document.querySelector(elem).innerHTML = string;
            }, delay)
        } else {
            document.querySelector(elem).innerHTML = string;
        }
    }
    
    // REFRESH PAGE
    function refresh_page(value) {
        history.go(0);
    }

    // REMOVE CSS CLASS
    function remove_css(elem, css) {
        const el = document.querySelector(elem);
        el.classList.remove(css);
    }

    // REMOVE ELEMENT
    function remove_element(elem) {
        const el = document.querySelector(elem);
        el.parentNode.removeChild(el);
    }

    // REMOVE ELEMENT ATTRIBUTE
    function remove_element_attribute(elem, attr) {
        document.querySelector(elem).removeAttribute(attr);
    }
    
    // SET ELEMENT ATTRIBUTES
    function set_element_attribute(elem, attr, value) {
        document.querySelector(elem).setAttribute(attr, value);
    }

    // SHOW ELEM (SHOW / HIDE)
    function show_elem(elem, css) {
        const el = document.querySelector(elem);
        el.classList.remove(css);
    }
    
    // SCROLL TO TOP OF PAGE
    function scroll_to_top(value) {
        window.scrollTo(0, 0);
    }
    
    // TOGGLE CSS CLASS
    function toggle_css(elem, css) {
        const elems = document.querySelectorAll(elem);
        elems.forEach(e => e.classList.toggle(css))
    }

    ////////////////////////////////////////
    // register modals
    Shiny.addCustomMessageHandler("add_css", function (value) {
        add_css(value[0], value[1]);
    });

    Shiny.addCustomMessageHandler("console_error", function(value) {
        console_error(value);
    });

    Shiny.addCustomMessageHandler("console_log", function (value) {
        console_log(value);
    });
    
    Shiny.addCustomMessageHandler("console_table", function (value) {
        console_table(value);
    });

    Shiny.addCustomMessageHandler("console_warn", function(value) {
        console_warn(value);
    });

    Shiny.addCustomMessageHandler("hide_elem", function (value) {
        hide_elem(value[0], value[1]);
    });

    Shiny.addCustomMessageHandler("insert_adjacent_html", function(value) {
        insert_adjacent_html(value[0], value[1], value[2])
    });

    Shiny.addCustomMessageHandler("inner_html", function (value) {
        inner_html(value[0], value[1], value[2])
    });

    Shiny.addCustomMessageHandler("refresh_page", function (value) {
        refresh_page(value);
    });

    Shiny.addCustomMessageHandler("remove_css", function (value) {
        remove_css(value[0], value[1]);
    });

    Shiny.addCustomMessageHandler("remove_element", function(value) {
        remove_element(value)
    })

    Shiny.addCustomMessageHandler("remove_element_attribute", function(value) {
        remove_element_attribute(value[0], value[1])
    })

    Shiny.addCustomMessageHandler("set_element_attribute", function (value) {
        set_element_attribute(value[0], value[1], value[2]);
    });

    Shiny.addCustomMessageHandler("scroll_to_top", function (value) {
        scroll_to_top(value);
    })

    Shiny.addCustomMessageHandler("show_elem", function (value) {
        show_elem(value[0], value[1]);
    });

    Shiny.addCustomMessageHandler("toggle_css", function (value) {
        toggle_css(value[0], value[1]);
    });

})();