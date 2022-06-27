import UIKit

struct Room {
    
    static let height:Int  = 5
    static let width = 5
    
    func printSituation(player: Player){
        for i in 1...Room.height {
            for j in 1...Room.width {
                if i == player.y && j == player.x {
                    print("1",terminator: "")
                } else {
                    print("0",terminator: "")
                }
            }
            print("")
        }
        print("")
    }
}

struct Player {
    
    var x: Int
    var y: Int
    var name: String
    
    mutating func move(direction:Direction) -> (Player, Box){
        switch direction{
        case .left: if x > 0 {
            x -= 1
        }
        case .right: if x < Room.width {
            x += 1
        }
        case .up: if y > 0 {
            y -= 1
        }
        case .down:if x == Box.x{
            if 
        }
            x == Box.x && y == Box.y - 1 && Box.y <  Room.height{
            y += 1
            Box.y += 1
        } else if
            
            y < Room.height {
            y += 1
        }
        }
        return (self, Box
    }
}

struct Box {
    static var x = 3
    static var y = 3
}

enum Direction{
    case left
    case right
    case up
    case down
}

var room = Room()
var box = Box()
var player = Player(x: 2, y: 2, name: "Peter")

room.printSituation(player: player)
player.move(direction: .right)
room.printSituation(player: player)
player.move(direction: .right)
player.move(direction: .right)
player.move(direction: .right)
player.move(direction: .up)
room.printSituation(player: player)


