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
    FileStream fileIn: './cell.st'.
    sizeX := 10.
    sizeY := 10.
    map := OrderedCollection new.
    1 to: sizeX do: [:x |
      1 to: sizeY do: [:y |
        map add: (Cell new: x y: y).
      ].
    ].
  ]

  draw [
    <category: 'Draw a board in console'>
      1 to: sizeX do: [:x |
        1 to: sizeY do: [:y |
          '_ ' display.
        ].
        Transcript cr.
      ].
      Transcript cr.
  ]
]
