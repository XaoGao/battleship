Object subclass: ConsolePrinter [
  | board |
  <comment: 'Draw a board in console'>

  draw: map [
    | cellType |
    <category: 'Draw a board in console'>
    1 to: (map basicSize) do: [:x |
      1 to: ((map at: x) basicSize ) do: [:y |
        cellType := ((map at: x) at: y) type.
        cellType = 'empty' ifTrue: ['_ ' display].
        cellType = 'hit' ifTrue: ['x ' display].
        cellType = 'ship' ifTrue: ['s ' display].
      ].
      Transcript cr.
    ].
    Transcript cr.
  ]
]
