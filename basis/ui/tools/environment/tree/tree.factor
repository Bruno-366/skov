! Copyright (C) 2017 Nicolas Pénet.
! See http://factorcode.org/license.txt for BSD license.
USING: accessors code locals sequences ui.gadgets
ui.gadgets.packs ui.tools.environment.cell
ui.tools.environment.common ;
IN: ui.tools.environment.tree

:: build-tree ( node -- shelf )
    <pile> { 3 3 } >>gap 1 >>fill
    <shelf> { 3 3 } >>gap 1 >>align node contents>> [ build-tree ] map add-gadgets add-gadget
    node <cell> add-gadget ;

:: <inside-tree> ( word -- pile )
    <shelf> word contents>> [ build-tree ] map add-gadgets ;

:: <outside-tree> ( word -- shelf )
    <pile> { 3 3 } >>gap 1 >>fill
    <shelf> { 3 3 } >>gap 1 >>align word introduces [ <cell> ] map add-gadgets add-gadget
    word <cell> add-gadget
    word returns [ first <cell> add-gadget ] unless-empty ;
