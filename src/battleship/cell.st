"cell.st"
Object subclass: Cell [
  | x y type|
  <comment: 'Represent a cell in board'>
  Cell class >> new: aX y: aY [
    <category: 'instance creation'>
    | r |
    r := super new.
    r init: aX y: aY.
    ^r
  ]

  init: aX y: aY [
    <category: 'initialization'>
    x := aX.
    y := aY.
    type := 'empty'.
  ]

  type [
    ^type
  ]
]
