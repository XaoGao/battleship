Object subclass: Cell [
  | x y type|
  <comment:
    'I represent a place to deposit and withdraw money'>
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
    y := aY
    type := aType
  ]
]
