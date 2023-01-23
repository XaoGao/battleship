Object subclass: Board [
  | sizeX sizeY map |
  <comment: 'Represent a board in battleship'>
  Board class >> new [
    <category: 'instance creation'>
    | r |
    r := super new.
    r init.
    ^r
  ]

  init [
    <category: 'initialization'>
    FileStream fileIn: 'cell.st'.
    sizeX := 10.
    sizeY := 10.
    map := Array new: sizeY.
    1 to: sizeX do: [:i|
      map at: i put: (Array new: sizeX).
    ].
    1 to: sizeX do: [:i |
      1 to: sizeY do: [:j |
        (map at: i) at: j put: (Cell new: i y: j).
      ].
    ].
  ]

  draw [
    | cellType |
    <category: 'Draw a board in console'>
      1 to: sizeX do: [:x |
        1 to: sizeY do: [:y |
          cellType := ((map at: x) at: y) type.
          cellType = 'empty' ifTrue: ['_ ' display].
          cellType = 'hit' ifTrue: ['x ' display].
          cellType = 'ship' ifTrue: ['s ' display].
        ].
        Transcript cr.
      ].
      Transcript cr.
  ]

  map [
    ^map
  ]
]
