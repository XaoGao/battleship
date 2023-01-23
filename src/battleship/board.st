Object subclass: Board [
  | col row map printer |
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
    FileStream fileIn: 'src/battleship/cell.st'.
    FileStream fileIn: 'src/battleship/consolePrinter.st'.
    col := 10.
    row := 10.
    map := Array new: row.
    1 to: col do: [:i|
      map at: i put: (Array new: col).
    ].
    1 to: col do: [:i |
      1 to: row do: [:j |
        (map at: i) at: j put: (Cell new: i y: j).
      ].
    ].
    printer := ConsolePrinter new: map.
  ]

  draw [
    | cellType |
    <category: 'Draw a board in console'>
      printer draw
  ]

  map [
    ^map
  ]
]

b := Board new.
b draw