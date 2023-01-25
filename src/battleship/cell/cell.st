Object subclass: Cell [
  | x y type|
  <comment: 'Represent a cell in board'>
  Cell class >> new: aX y: aY type: aType [
    <category: 'instance creation'>
    | r |
    r := super new.
    r init: aX y: aY type: aType.
    ^r
  ]

  init: aX y: aY type: aType [
    <category: 'initialization'>
    x := aX.
    y := aY.
    type := aType.
  ]

  type [
    ^type
  ]

  isHit [
    type = 'hit'
  ]

  isEmpty [
    type = 'empty'
  ]

  isShip [
    type = 'ship'
  ]
]
