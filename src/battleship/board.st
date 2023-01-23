Object subclass: Board [
  | col row map printer |
  <comment: 'Represent a board in battleship'>
  Board class >> new: aCol row: aRow [
    <category: 'instance creation'>
    | r |
    r := super new.
    r init: aCol row: aRow.
    ^r
  ]

  init: aCol row: aRow[
    <category: 'initialization'>
    FileStream fileIn: 'src/battleship/cell.st'.
    FileStream fileIn: 'src/battleship/consolePrinter.st'.
    col := aCol.
    row := aRow.
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
    <category: 'Draw a board in console'>
    printer draw
  ]

  map [
    ^map
  ]
]
