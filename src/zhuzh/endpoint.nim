type
  CardinalDir* = enum
    cdN  = "N",  cdNE = "NE", cdE  = "E",  cdSE = "SE"
    cdS  = "S",  cdSW = "SW", cdW  = "W",  cdNW = "NW"

  EndpointKind* = enum
    ekAnchor    # attached to a component via cardinal direction
    ekAbsolute  # free floating absolute position

  Endpoint* = object
    case kind*: EndpointKind
    of ekAnchor:
      componentId*: string
      direction*:   CardinalDir
    of ekAbsolute:
      x*, y*: float
