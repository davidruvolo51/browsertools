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
    getValue: function (el) {
        let attributes = $(el.attributes);
        let out = {}, attr;
        attributes.map(a => {
            attr = attributes[a];
            out[`${attr.name}`] = attr.value
        })
        return out;
    }
});

export default get_attribs;