type
  TextAlign* = enum
    taLeft   = "left"
    taCenter = "center"
    taRight  = "right"

  VAlign* = enum
    vaTop    = "top"
    vaMiddle = "middle"
    vaBottom = "bottom"

  Text* = object
    content*:    string     # \n delimited for multiline
    size*:       float
    color*:      string     # hex or theme token e.g. "$accent"
    align*:      TextAlign
    valign*:     VAlign
    bold*:       bool
    italic*:     bool
    lineHeight*: float
