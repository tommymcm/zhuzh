import tables
import props

type
  NamedColor* = object
    name*:  string
    value*: string          # hex e.g. "#FF0000"

  NamedStyle* = object
    name*:  string
    props*: Table[string, PropValue]

  Theme* = ref object
    colors*: seq[NamedColor]
    styles*: seq[NamedStyle]
