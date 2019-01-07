! Copyright (C) 2015 Nicolas Pénet.
! See http://factorcode.org/license.txt for BSD license.
USING: accessors arrays colors colors.gray kernel locals math
math.order sequences ui.gadgets ui.gadgets.buttons
ui.pens.gradient-rounded ui.tools.environment.theme ;
IN: ui.gadgets.buttons.round

TUPLE: round-button < button ;

M: round-button pref-dim*
    gadget-child pref-dim first2 [ 10 + ] dip [ 20 max ] bi@ 2array ;

:: <round-button> ( colors label quot -- button )
    label quot round-button new-button
    colors dup first >gray gray>> 0.5 < light-text-colour dark-text-colour ?
    <gradient-squircle> >>interior
    dup gadget-child
    [ t >>bold? 13 >>size transparent >>background ] change-font drop ;
