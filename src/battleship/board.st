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

    map := self initMap.
  ]

  draw [
    <category: 'Draw a board in console'>
    printer draw: map
  ]

  hit: aX y: aY [
    <category: 'Convert type to hited'>
    (map at: aX) at: aY put: (HitCell new: aX y: aY)
  ]

  placeShip: cell direction: aDirection size: aSize [
    | x y |
    <category: 'Convert cells type to ship'>
    x := cell x.
    y := cell y.
    (aDirection = 'hor')
      ifTrue: [
        x to: ((x + aSize) - 1) do: [:i|
          (map at: i) at: y put: (ShipCell new: i y: y)
        ].
      ]
      ifFalse: [
        y to: ((y + aSize) - 1) do: [:i|
          (map at: x) at: i put: (ShipCell new: x y: i)
        ].
      ]
  ]

  placeShips [
    | direction startCell shipIsPlaced |
    <category: 'Find place to ships in map'>
    #(1 1 1 1 2 2 2 3 3 4) do: [:ship |
      shipIsPlaced := False.
      direction := self randomDirection.
      [shipIsPlaced = True] whileFalse: [
        startCell := self randomStartElement.
        (startCell isEmpty)
          ifTrue: [
            ((direction = 'hor') & ((row - (startCell x)) > ship) & ((self notAnyShipHor: (startCell x) y: (startCell y) size: ship)))
              ifTrue: [
                self placeShip: startCell direction: 'hor' size: ship.
                shipIsPlaced := True.
              ].
            ((direction = 'ver') & ((col - (startCell y)) > ship) & ((self notAnyShipVer: (startCell x) y: (startCell y) size: ship)))
              ifTrue: [
                self placeShip: startCell direction: 'ver' size: ship.
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

  notAnyShipHor: startX y: startY size: shipSize [
    <category: 'Check cells is alrady shiped in horizont'>
    | nextCell |
    ((startX + shipSize) > col)
      ifTrue: [^true].
    startX to: ((startX + shipSize) - 1) do: [:i|
      nextCell := (map at: startY) at: i.
      (nextCell isShip = True)
        ifTrue: [
          ^false.
        ].
    ].
    ^true.
  ]

  notAnyShipVer: startX y: startY size: shipSize [
    <category: 'Check cells is alrady shiped in vertical'>
    | nextCell |
    ((startY + shipSize) > row)
      ifTrue: [^true].
    startY to: ((startY + shipSize) - 1) do: [:i|
      nextCell := (map at: startX) at: i.
      (nextCell isShip = True)
        ifTrue: [
          ^false.
        ].
    ].
    ^true.
  ]

  initMap [
    <category: 'Init a 2d array for map'>
    | x |
    x := Array new: row.
    1 to: col do: [:i|
      x at: i put: (Array new: col).
    ].
    1 to: col do: [:i |
      1 to: row do: [:j |
        (x at: i) at: j put: (EmptyCell new: i y: j).
      ].
    ].
    ^x
  ]
]
