////////////////////////////////////////////////////////////////////////////////
// FILE: index.js
// AUTHOR: David Ruvolo
// CREATED: 2019-11-11
// MODIFIED: 2020-01-25
// PURPOSE: main js file for app
// DEPENDENCIES: NA
// STATUS: working
// COMMENTS: NA
////////////////////////////////////////////////////////////////////////////////
// DEFINE FUNCTIONS
(function () {

    // ADD CSS CLASS
    function add_css(elem, css) {
        const elems = document.querySelectorAll(elem);
        elems.forEach(e => e.classList.add(css))
    }

    // CLEAR INPUTS
    function clear_input(elem, value) {
        const inputs = document.querySelectorAll(elem);
        inputs.forEach(input => {
            if (value.length > 0) {
                input.value = value
            } else {
                input.value = ""
            }
        });
    }

    // LOG SOMETHING TO THE CONSOLE
    function console_log(value, asDir) {
        if (asDir) {
            console.dir(value);
        } else {
            console.log(value);
        }
    }

    // REMOVE CSS CLASS
    function remove_css(elem, css) {
        const elems = document.querySelectorAll(elem);
        elems.forEach(e => e.classList.remove(css))
    }

    // TOGGLE CSS CLASS
    function toggle_css(elem, css) {
        const elems = document.querySelectorAll(elem);
        elems.forEach(e => e.classList.toggle(css))
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

    // SET ELEMENT ATTRIBUTES
    function set_element_attribute(elem, attr, value) {
        document.querySelector(elem).setAttribute(attr, value);
    }

    // REFRESH PAGE
    function refresh_page(value) {
        history.go(0);
    }

    // SCROLL TO TOP OF PAGE
    function scroll_to_top(value) {
        window.scrollTo(0, 0);
    }

    ////////////////////////////////////////

    // SHOW ELEM (SHOW / HIDE)
    function show_elem(elem, css) {
        const el = document.querySelector(elem);
        if(css.length > 0) {
            el.classList.remove(css);
        } else {
            el.classList.remove("hidden");
        }
        el.removeAttribute("hidden");
    }

    // HIDE ELEM
    function hide_elem(elem, css) {
        const el = document.querySelector(elem);
        if(css.length > 0) {
            el.classList.add(css)
        } else {
            el.classList.add("hidden");
        }
        el.setAttribute("hidden", true);
    }

    ////////////////////////////////////////
    // register modals
    Shiny.addCustomMessageHandler("add_css", function (value) {
        add_css(value[0], value[1]);
    });

    Shiny.addCustomMessageHandler("clear_input", function (value) {
        clear_input(value)
    })

    Shiny.addCustomMessageHandler("console_log", function (value) {
        console_log(value[0], value[1]);
    });

    Shiny.addCustomMessageHandler("hide_elem", function (value) {
        hide_elem(value[0], value[1]);
    });
    Shiny.addCustomMessageHandler("inner_html", function (value) {
        inner_html(value[0], value[1])
    });

    Shiny.addCustomMessageHandler("refresh_page", function (value) {
        refresh_page(value);
    });

    Shiny.addCustomMessageHandler("remove_css", function (value) {
        remove_css(value[0], value[1]);
    });

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