# Property value type for sparse override tables.
# pkNull is the reset sentinel — reverts a key to its base value.
# String values may be theme tokens e.g. "$accent".

type
  PropKind* = enum
    pkString, pkFloat, pkBool, pkNull

  PropValue* = object
    case kind*: PropKind
    of pkString: strVal*: string
    of pkFloat:  floatVal*: float
    of pkBool:   boolVal*: bool
    of pkNull:   discard
