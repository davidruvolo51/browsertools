"use strict";(function(){function a(a,b){var c=document.querySelectorAll(a);c.forEach(function(a){return a.classList.add(b)})}function b(a,b){var c=document.querySelectorAll(a);c.forEach(function(a){a.value=0<b.length?b:""})}function c(a){console.log(a)}function d(a){console.table(a)}function e(a,b){var c=document.querySelector(a);0<b.length?c.classList.add(b):c.classList.add("hidden"),c.setAttribute("hidden",!0)}function f(a,b,c){c?setTimeout(function(){document.querySelector(a).innerHTML=b},c):document.querySelector(a).innerHTML=b}function g(){history.go(0)}function h(a,b){var c=document.querySelectorAll(a);c.forEach(function(a){return a.classList.remove(b)})}function i(a){var b=document.querySelectorAll(a);b.forEach(function(a){return a.parentNode.removeChild(a)})}function j(a,b){document.querySelector(a).removeAttribute(b)}function k(a,b,c){var d,e=["all","radio","checkbox"];-1==e.indexOf(b)&&console.error("Error in 'reset_input_groups':","type is not valid"),-1<e.indexOf(b)&&(!1,!1,!1);var f=document.querySelector(a),g=f.querySelector(d);f.value="",g.forEach(function(a){a.checked=!1,0<c.length&&(("true"===c||"false"===c)&&(a.checked=c),!0===el.getAttribute(c,"value")&&(a.checked=!0))})}function l(a,b,c){document.querySelector(a).setAttribute(b,c)}function m(a,b){var c=document.querySelector(a);0<b.length?c.classList.remove(b):c.classList.remove("hidden"),c.removeAttribute("hidden")}function n(){window.scrollTo(0,0)}function o(a,b){var c=document.querySelectorAll(a);c.forEach(function(a){return a.classList.toggle(b)})}Shiny.addCustomMessageHandler("add_css",function(b){a(b[0],b[1])}),Shiny.addCustomMessageHandler("clear_input",function(a){b(a)}),Shiny.addCustomMessageHandler("console_log",function(a){c(a)}),Shiny.addCustomMessageHandler("console_table",function(a){d(a)}),Shiny.addCustomMessageHandler("hide_elem",function(a){e(a[0],a[1])}),Shiny.addCustomMessageHandler("inner_html",function(a){f(a[0],a[1],a[2])}),Shiny.addCustomMessageHandler("refresh_page",function(a){g(a)}),Shiny.addCustomMessageHandler("remove_css",function(a){h(a[0],a[1])}),Shiny.addCustomMessageHandler("remove_element",function(a){i(a)}),Shiny.addCustomMessageHandler("remove_element_attribute",function(a){j(a[0],a[1])}),Shiny.addCustomMessageHandler("reset_input_groups",function(a){k(a[0],a[1],a[3])}),Shiny.addCustomMessageHandler("set_element_attribute",function(a){l(a[0],a[1],a[2])}),Shiny.addCustomMessageHandler("scroll_to_top",function(a){n(a)}),Shiny.addCustomMessageHandler("show_elem",function(a){m(a[0],a[1])}),Shiny.addCustomMessageHandler("toggle_css",function(a){o(a[0],a[1])})})();