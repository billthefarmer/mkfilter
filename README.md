jQuery-scale
============

This jQuery plugin adds scaling and specifying the origin of
transforms. It is based on jquery-rotate by Jakub Jankiewicz.

### Functions

  * jQuery(<element>).css('scale') Return the scale transform of an
    element
  * jQuery(<element>).css('scale', value) Set the scale of an element
  * jQuery(<element>).css('origin') Return the transform origin of an
    element
  * jQuery(<element>).css('origin', value) Set the transform
    origin of an element

### Values

The scale value is a floating point number. The transform value can be
set in px or %: jQuery(<element>).css('origin', '0px 50%'). One, two
or three values may be set. Three values are returned.

### Animation

I have included the hook for animation of scaling. The scale should be
set before using.

  * jQuery(<element>).animate({scale: value},...)
