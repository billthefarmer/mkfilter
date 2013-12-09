/* 
 * JQuery CSS scale and transform origin property using CSS3
 * transformations
 * Copyright (C) 2013 Bill Farmer. Based on jquery-rotate by
 * Jakub Jankiewicz  <http://jcubic.pl>
 * licensed under the LGPL Version 3 license.
 * http://www.gnu.org/licenses/lgpl.html
 */
(function($) {
    function getTransformProperty(element) {
        var properties = ['transform', 'WebkitTransform',
                          'MozTransform', 'msTransform',
                          'OTransform'];
        var p;
        while (p = properties.shift()) {
            if (element.style[p] !== undefined) {
                return p;
            }
        }
        return false;
    }
    $.cssHooks['scale'] = {
        get: function(elem, computed, extra) {
            var property = getTransformProperty(elem);
            if (property) {
                return elem.style[property].replace(/.*scale\((.*)\).*/, '$1');
            } else {
                return '';
            }
        },
        set: function(elem, value){
            var property = getTransformProperty(elem);
            if (property) {
                value = parseFloat(value);
                if (value == 0) {
                    elem.style[property] = '';
                } else {
                    elem.style[property] = 'scale(' + value + ')';
                }
            } else {
                return '';
            }
        }
    };
    $.fx.step['scale'] = function(fx) {
        $.cssHooks['scale'].set(fx.elem, fx.now);
    };
    function getTransformOriginProperty(element) {
        var properties = ['transformOrigin', 'WebkitTransformOrigin',
                          'MozTransformOrigin', 'msTransformOrigin',
                          'OTransformOrigin'];
        var p;
        while (p = properties.shift()) {
            if (element.style[p] !== undefined) {
                return p;
            }
        }
        return false;
    }
    $.cssHooks['origin'] = {
	get: function(elem, computed, extra) {
            var property = getTransformOriginProperty(elem);
            if (property) {
                return elem.style[property];
            } else {
                return '';
            }
        },
        set: function(elem, value){
            var property = getTransformOriginProperty(elem);
            if (property) {
                if (value == 0) {
                    elem.style[property] = '';
                } else {
                    elem.style[property] = value;
                }
            } else {
                return '';
            }
        }
    };
})(jQuery);
