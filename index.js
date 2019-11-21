////////////////////////////////////////////////////////////////////////////////
// FILE: index.js
// AUTHOR: David Ruvolo
// CREATED: 2019-11-11
// MODIFIED: 2019-11-21
// PURPOSE: main js file for app
// DEPENDENCIES: NA
// STATUS: working
// COMMENTS: NA
////////////////////////////////////////////////////////////////////////////////
// DEFINE FUNCTIONS
(function () {
    
    // ADD CSS CLASS
    function addCSS(elem, css) {
        document.querySelector(elem).classList.add(css);
    }

    // LOG SOMETHING TO THE CONSOLE
    function consoleLog(value, asDir) {
        if (asDir) {
            console.dir(value);
        } else {
            console.log(value);
        }
    }

    // REMOVE CSS CLASS
    function removeCSS(elem, css) {
        document.querySelector(elem).classList.remove(css);
    }

    // TOGGLE CSS CLASS
    function toggleCSS(elem, css) {
        document.querySelector(elem).classList.toggle(css);
    }

    // SET INNERHTML
    function innerHTML(elem, string) {
        document.querySelector(elem).innerHTML = string;
    }

    // SET ELEMENT ATTRIBUTES
    function setElementAttribute(elem, attr, value) {
        document.querySelector(elem).setAttribute(attr, value);
    }

    // REFRESH PAGE
    function refreshPage() {
        history.go(0);
    }

    // SCROLL TO TOP OF PAGE
    function scrollToTop(){
        window.scrollTo(0,0);
    }

    // SHOW ELEM (SHOW / HIDE)
    function showElem(id) {
        const el = document.getElementById(id);
        el.classList.remove("hidden");
        el.removeAttribute("hidden");
    }

    // HIDE ELEM
    function hideElem(id){
        const el = document.getElementById(id);
        el.classList.add("hidden");
        el.setAttribute("hidden", true);
    }

    ////////////////////////////////////////
    // register modals
    Shiny.addCustomMessageHandler("addCSS", function (value) {
        addCSS(value[0], value[1]);
    });

    Shiny.addCustomMessageHandler("consoleLog", function (value) {
        consoleLog(value[0], value[1]);
    });

    Shiny.addCustomMessageHandler("innerHTML", function (value) {
        innerHTML(value[0], value[1])
    });

    Shiny.addCustomMessageHandler("refreshPage", function (event) {
        refreshPage();
    });

    Shiny.addCustomMessageHandler("removeCSS", function (value) {
        removeCSS(value[0], value[1]);
    });

    Shiny.addCustomMessageHandler("setElementAttribute", function (value) {
        setElementAttribute(value[0], value[1], value[2]);
    });

    Shiny.addCustomMessageHandler("toggleCSS", function (value) {
        toggleCSS(value[0], value[1]);
    });

    Shiny.addCustomMessageHandler("hideElem", function (value) {
        hideElem(value[0], value[1]);
    });
    
    Shiny.addCustomMessageHandler("showElem", function (value) {
        showElem(value[0], value[1]);
    });

    Shiny.addCustomMessageHandler("scrollToTop", function(value){
        scrollToTop();
    })
})();