Object subclass: Game [
  | board |
  <comment: 'Game engine'>
  Game class >> new [
    | r |
    r := super new.
    r init.
    ^r.
  ]
  init [
    <category: 'initialization'>
    FileStream fileIn: 'src/battleship/board.st'.
    board := Board new: 10 row: 10.
  ]

  start [
    board draw.
  ]
]
