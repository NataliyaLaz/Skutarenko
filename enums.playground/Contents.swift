//1.
enum Color {
    case white
    case black
}

import Darwin
enum Chess {
    
    case king(color: Color, column: String, row: Int, type: String)
    case queen(color: Color, column: String, row: Int, type: String)
    case rook(color: Color, column: String, row: Int, type: String)
    case bishop(color: Color, column: String, row: Int, type: String)
    case knight(color: Color, column: String, row: Int, type: String)
    case pawn(color: Color, column: String, row: Int, type: String)
    
}

var kingWhite = Chess.king(color: .white, column: "F", row: 7, type: "King")
var rookWhite = Chess.rook(color: .white, column: "H", row: 6, type: "Rook")
var kingBlack = Chess.king(color: .black, column: "H", row: 8, type: "King")

//2.
var myChessArray: [Chess] = [kingWhite, rookWhite, kingBlack]

func describeChessPiece(figure: Chess) {
    switch figure{
    case let .king(color, column, row, type):
        print("It's a \(color) \(type) at \(column)\(row)")
    case let .queen(color, column, row, type):
        print("It's a \(color) \(type) at \(column)\(row)")
    case let .rook(color, column, row, type):
        print("It's a \(color) \(type) at \(column)\(row)")
    case let .bishop(color, column, row, type):
        print("It's a \(color) \(type) at \(column)\(row)")
    case let .knight(color, column, row, type):
        print("It's a \(color) \(type) at \(column)\(row)")
    case let .pawn(color, column, row, type):
        print("It's a \(color)\(type) at \(column)\(row)")
    }
}

func describeAllChessFigures(figures: [Chess]) {
    for figure in figures{
        describeChessPiece(figure: figure)
    }
}

describeAllChessFigures(figures: myChessArray)

//3.

//for i in 1...8{
//    for j in 1...8{
//        if i % 2 != j % 2 {
//            print("\u{1f3fd}", terminator: "")
//        } else {
//            print("\u{1F67E}",terminator: "")
//        }
//    }
//    print("")
//}
var whiteDict = [String: String]()
var blackDict = [String: String]()
var letterDict = [String: Int]()

whiteDict = ["King": "\u{2654}",
             "Queen": "\u{2655}",
             "Rook": "\u{2656}",
             "Bishop": "\u{2657}",
             "Knight": "\u{2658}",
             "Pawn": "\u{2659}"
]

blackDict = ["King": "\u{265A}",
             "Queen": "\u{265B}",
             "Rook": "\u{265C}",
             "Bishop": "\u{265D}",
             "Knight": "\u{265E}",
             "Pawn": "\u{265F}"
]

letterDict = ["A": 1,
              "B":2,
              "C":3,
              "D":4,
              "E":5,
              "F":6,
              "G":7,
              "H":8,
]


func locateChessPiece(figure: Chess) -> (Int, Int, String){
    var x = 0
    var y = 0
    var pic = ""

    switch figure{
    case .king(let color, let column, let row, let type) where color == .white:
        x = letterDict[column]!
        y = row
        pic = whiteDict[type]!
    case let .king(color, column, row, type) where color == .black:
        x = letterDict[column]!
        y = row
        pic = blackDict[type]!
    case let .queen(color, column, row, type) where color == .white:
        x = letterDict[column]!
        y = row
        pic = whiteDict[type]!
    case let .queen(color, column, row, type) where color == .black:
        x = letterDict[column]!
        y = row
        pic = blackDict[type]!
    case let .rook(color, column, row, type) where color == .white:
        x = letterDict[column]!
        y = row
        pic = whiteDict[type]!
    case let .rook(color, column, row, type) where color == .black:
        x = letterDict[column]!
        y = row
        pic = blackDict[type]!
    case let .bishop(color, column, row, type) where color == .white:
        x = letterDict[column]!
        y = row
        pic = whiteDict[type]!
    case let .bishop(color, column, row, type) where color == .black:
        x = letterDict[column]!
        y = row
        pic = blackDict[type]!
    case let .knight(color, column, row, type) where color == .white:
        x = letterDict[column]!
        y = row
        pic = whiteDict[type]!
    case let .knight(color, column, row, type) where color == .black:
        x = letterDict[column]!
        y = row
        pic = blackDict[type]!
    case let .pawn(color, column, row, type) where color == .white:
        x = letterDict[column]!
        y = row
        pic = whiteDict[type]!
    case let .pawn(color, column, row, type) where color == .black:
        x = letterDict[column]!
        y = row
        pic = blackDict[type]!
    default: print("smth went wrong")
    }
    return (x,y,pic)
}

func drawChessField(array: [Chess]){
    for i in 1...8{
    mainloop:for j in 1...8{
            for element in array{
                let(x, y, pic) = locateChessPiece(figure: element)
                if i == x && j == y{
                    print(pic, terminator: "")
                    continue mainloop
                }
            }
            if i % 2 != j % 2 {
                print("\u{1f3fd}", terminator: "")
            } else {
                print("\u{1F67E}",terminator: "")
            }
        }
        print("")
    }
}
drawChessField(array: myChessArray)

//4.

func moveFigure(figure:Chess, coordinates: (String, Int)) -> Chess{
    var figurka = Chess.pawn(color: .white, column: "A", row: 1, type: "Pawn")
    
    var col: Color = .white
    var typ: String = ""


    switch figure{
    case .king(let color, _, _,  let type):
        col = color
        typ = type
    case .queen(let color, _, _,  let type):
        col = color
        typ = type
    case .rook(let color, _, _,  let type):
        col = color
        typ = type
    case .bishop(let color, _, _,  let type):
        col = color
        typ = type
    case .knight(let color, _, _,  let type):
        col = color
        typ = type
    case .pawn(let color, _, _,  let type):
        col = color
        typ = type
    }
  
        switch typ {
        case "King":
            figurka = Chess.king(color: col, column: coordinates.0, row: coordinates.1, type: "King")
        case "Queen":
            figurka = Chess.king(color: col, column: coordinates.0, row: coordinates.1, type: "Queen")
        case "Rook":
            figurka = Chess.king(color: col, column: coordinates.0, row: coordinates.1, type: "Rook")
        case "Bishop":
            figurka = Chess.king(color: col, column: coordinates.0, row: coordinates.1, type: "Bishop")
        case "Knight":
            figurka = Chess.king(color: col, column: coordinates.0, row: coordinates.1, type: "Knight")
        case "Pawn":
            figurka = Chess.king(color: col, column: coordinates.0, row: coordinates.1, type: "Pawn")
        default: print( "Smth went wrong")
        }
    return figurka
}
kingWhite =  moveFigure(figure: kingWhite, coordinates: ("B", 4))
myChessArray.removeAll()
myChessArray = [kingWhite, rookWhite, kingBlack]

drawChessField(array: myChessArray)


//Scalar value try

let unicode = 0x2654 + 1
let scalar = UnicodeScalar(248)
print(scalar!)

for i in 250...260 {
    print(UnicodeScalar(i)!)
}

