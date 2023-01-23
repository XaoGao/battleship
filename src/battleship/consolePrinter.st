Object subclass: ConsolePrinter [
  | board |
  <comment: 'Draw a board in console'>
  ConsolePrinter class >> new: aBoard [
    <category: 'instance creation'>
    | r |
    r := super new.
    r init: aBoard.
    ^r
  ]

  init: aBoard [
    <category: 'initialization'>
    board := aBoard
  ]

  draw [
    | cellType |
    <category: 'Draw a board in console'>
    1 to: (board basicSize) do: [:x |
      1 to: ((board at: x) basicSize ) do: [:y |
        cellType := ((board at: x) at: y) type.
        cellType = 'empty' ifTrue: ['_ ' display].
        cellType = 'hit' ifTrue: ['x ' display].
        cellType = 'ship' ifTrue: ['s ' display].
      ].
      Transcript cr.
    ].
    Transcript cr.
  ]
]
