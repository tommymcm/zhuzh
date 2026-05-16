import std/tables, std/options
import props, text, endpoint

type
  BaseProps* = object
    x*, y*:          float
    width*, height*: float
    color*:          string         # hex or theme token
    opacity*:        float
    visible*:        bool
    text*:           Option[Text]   # optional — not all components need text

  EndpointOverride* = object
    start*:  Option[Endpoint]
    finish*: Option[Endpoint]

  FrameOverride* = object
    frame*:               int
    persistent*:          Table[string, PropValue]  # this frame and forward
    temporary*:           Table[string, PropValue]  # this frame only
    persistentEndpoints*: Option[EndpointOverride]
    temporaryEndpoints*:  Option[EndpointOverride]

  ComponentKind* = enum
    ckRect    = "rect"
    ckEllipse = "ellipse"
    ckText    = "text"              # standalone text box
    ckArrow   = "arrow"
    ckImage   = "image"

  Component* = object
    id*:        string
    style*:     string              # named style from theme, "" = none
    base*:      BaseProps           # shared across all kinds
    overrides*: seq[FrameOverride]  # sorted by frame ascending
    case kind*: ComponentKind
    of ckArrow:
      start*:  Endpoint
      finish*: Endpoint             # "end" is a keyword in Nim
    of ckImage:
      src*: string                  # file path
    of ckRect, ckEllipse, ckText:
      discard

  Diagram* = object
    version*:    int
    theme*:      theme.Theme        # nil = no theme
    components*: seq[Component]     # z-order: index 0 = bottom
    frames*:     int
