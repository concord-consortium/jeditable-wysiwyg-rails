/*
 * Wysiwyg input for Jeditable
 *
 * Copyright (c) 2008 Mika Tuupola
 *
 * Licensed under the MIT license:
 *   http://www.opensource.org/licenses/mit-license.php
 * 
 * Depends on jWYSIWYG plugin by Juan M Martinez:
 *   http://projects.bundleweb.com.ar/jWYSIWYG/
 *
 * Project home:
 *   http://www.appelsiini.net/projects/jeditable
 *
 * Revision: $Id$
 *
 */

$.editable.addInputType('wysiwyg', {
    /* Use default textarea instead of writing code here again. */
    //element : $.editable.types.textarea.element,
    element : function (settings, original) {
        // console.log('Element function called.');
        // Called first, to build element.
        /* The commented-out method was meant to hide the textarea to avoid flicker.
        See https://github.com/tuupola/jquery_jeditable_wysiwyg/commit/3ded3c17027f2284385cc1a5e39be44963e63da2
        This disables the HTML button in the jWYSIWYG toolbar, however, so I removed it. */
        var textarea = $('<textarea>'); // .css("opacity", "0")
        if (settings.rows) {
            textarea.attr('rows', settings.rows);
        } else {
            textarea.height(settings.height);
        }
        if (settings.cols) {
            textarea.attr('cols', settings.cols);
        } else {
            textarea.width(settings.width);
        }
        $(this).append(textarea);
        return (textarea);
    },
    content : function (string, settings, original) {
        // Called second, to populate element.
        // console.log('Content function called.');
        /* jWYSIWYG plugin uses .text() instead of .val()        */
        /* For some reason it did not work work with generated   */
        /* textareas so I am forcing the value here with .text() */
        // console.log('Content is ' + string);
        $('textarea', this).text(string);
    },
    plugin : function (settings, original) {
        // Called third.
        // console.log('Plugin function called.');
        var self = this;
        /* Force autosave off to avoid "element.contentWindow has no properties" */
        settings.wysiwyg = $.extend({autoSave: false}, settings.wysiwyg);
        if (settings.wysiwyg) {
            setTimeout(function () { $('textarea', self).wysiwyg(settings.wysiwyg); }, 0);
        } else {
            setTimeout(function () { $('textarea', self).wysiwyg(); }, 0);
        }
    },
    submit : function (settings, original) {
        // console.log('Submit function called.');
        var iframe         = $("iframe", this).get(0);
        var inner_document = typeof (iframe.contentDocument) === 'undefined' ?  iframe.contentWindow.document.body : iframe.contentDocument.body;
        var new_content    = $(inner_document).html();
        // s/val/text/
        // What's in the WYSIWYG editor is what's saved
        // If a change is made in HTML mode and saved before switching back to WYSIWYG mode, it isn't saved.
        // If changes are made in WYSIWYG mode, they're always saved.
        // So if we submit, and HTML mode is different from WYSIWYG mode, we should keep HTML mode.
        var area_text = $('textarea', this).text();
        var area_val = $('textarea', this).val();
        // console.log('WYSIWYG mode has ' + new_content);
        // console.log('HTML mode has val of ' + area_val);
        // console.log('HTML mode has text of ' + area_text);
        // Set both of these to ensure content is saved.
        if ((new_content !== area_val) && (area_val !== area_text)) {
            // console.log('Saving HTML mode val().');
            area_val;
        } else {
            // console.log('Saving WYSIWYG mode.');
            $('textarea', this).text(new_content);
        }
    }
});
