////////////////////////////////////////////////////////////////////////////////
// FILE: get_attribs.js
// AUTHOR: David Ruvolo
// CREATED: 2020-11-07
// MODIFIED: 2020-11-07
// PURPOSE: gather and expose html attribs for use in the shiny server
// DEPENDENCIES: 
// STATUS: 
// COMMENTS: 
////////////////////////////////////////////////////////////////////////////////

const get_attribs = new Shiny.InputBinding();
$.extend(get_attribs, {
    find: function (scope) {
        return $(scope).find("span[data-browsertools-indexible='true']").parent();
    },
    initialize: function (el) {
        this.getValue(el);
    },
    getValue: function (el) {
        let attributes = $(el.attributes);
        let out = {}, attr;
        attributes.map(a => {
            attr = attributes[a];
            out[`${attr.name}`] = attr.value
        })
        return out;
    },
    subscribe: function (el, callback) {
        const mutationCallback = function (mutationsList) {
            for (const mutation of mutationsList) {
                if (mutation.type === "attributes") {
                    callback()
                }
            }
        }

        const observer = new MutationObserver(mutationCallback);
        observer.observe($(el)[0], { attributes: true });

    },
    unsubscribe: function (el) {
        $(el).off(".get_attribs");
        this.subscribe.observer.disconnect();
    }
});

export default get_attribs;