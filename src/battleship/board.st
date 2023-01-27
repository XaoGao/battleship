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
    FileStream fileIn: 'src/battleship/cell/emptyCell.st'.
    FileStream fileIn: 'src/battleship/cell/shipCell.st'.
    FileStream fileIn: 'src/battleship/cell/hitCell.st'.
    FileStream fileIn: 'src/battleship/consolePrinter.st'.
    
    col := aCol.
    row := aRow.
    printer := ConsolePrinter new.

    map := Array new: row.
    1 to: col do: [:i|
      map at: i put: (Array new: col).
    ].
    1 to: col do: [:i |
      1 to: row do: [:j |
        (map at: i) at: j put: (EmptyCell new: i y: j).
      ].
    ].
  ]

  draw [
    <category: 'Draw a board in console'>
    printer draw: map
  ]

  hit: aX y: aY [
    <category: 'Convert type to hited'>
    (map at: aX) at: aY put: (HitCell new: aX y: aY)
  ]

  planeShip: aX y: aY [
    <category: 'Convert type to ship'>
    (map at: aX) at: aY put: (ShipCell new: aX y: aY)
  ]

  placeShips [
    | direction startEl shipIsPlaced |
    <category: 'Place ships to map'>
    #(1 1 1 1 2 2 2 3 3 4) do: [:ship |
      shipIsPlaced := False.
      direction := self randomDirection.
      [shipIsPlaced = True] whileFalse: [
        startEl := self randomStartElement.
        placeShip: startEl.
        (startEl isEmpty)
          ifTrue: [
            ((direction = 'hor') & (col - (startEl x) >= ship))
              ifTrue: [
                (map at: (startEl x)) at: (startEl y) put: (ShipCell new: (startEl x) y: (startEl y)).
                shipIsPlaced := True.
              ].
            ((direction = 'ver') & (row - (startEl y) >= ship))
              ifTrue: [
                (map at: (startEl x)) at: (startEl y) put: (ShipCell new: (startEl x) y: (startEl y)).
                shipIsPlaced := True.
              ].
          ]
      ]
    ]
  ]

  randomDirection [
    <category: 'Pick a random direction'>
    ^#('hor' 'ver') atRandom.
  ]

  randomStartElement [
    | startX startY startEl |
    <category: 'Pick a random cell in map'>
    startX := Random between: 1 and: col.
    startY := Random between: 1 and: row.
    startEl := (map at: startX) at: startY.
    ^startEl
  ]
]
