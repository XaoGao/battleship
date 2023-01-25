FileStream fileIn: 'src/battleship/cell/cell.st'.

Cell subclass: HitCell [
  HitCell class >> new: aX y: aY [
    <category: 'instance creation'>
    | r |
    r := super new: aX y: aY type: 'hit'.
    ^r
  ]
]