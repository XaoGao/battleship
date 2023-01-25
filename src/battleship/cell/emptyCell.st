FileStream fileIn: 'src/battleship/cell/cell.st'.

Cell subclass: EmptyCell [
  EmptyCell class >> new: aX y: aY [
    <category: 'instance creation'>
    | r |
    r := super new: aX y: aY type: 'empty'.
    ^r
  ]
]