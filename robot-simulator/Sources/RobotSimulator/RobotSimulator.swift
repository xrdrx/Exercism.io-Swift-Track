//Solution goes in Sources
struct SimulatedRobot {
    private(set) var bearing: Direction = .north
    private(set) var coordinates: Coordinates = [0, 0]
    
    mutating func orient(_ direction: Direction) {
        self.bearing = direction
    }
    
    mutating func turnRight() {
        setDirection(after: .turnRight)
    }
    
    mutating func turnLeft() {
        setDirection(after: .turnLeft)
    }
    
    private mutating func setDirection(after command: Command) {
        var directions = Direction.allCases
        if command == .turnLeft { directions.reverse() }
        let current = directions.index(of: bearing)!
        bearing = directions[(current + 1) % directions.count]
    }
    
    mutating func at(x: Int, y: Int) {
        coordinates.x = x
        coordinates.y = y
    }
    
    mutating func advance() {
        switch bearing {
        case .north:
            coordinates.y += 1
        case .east:
            coordinates.x += 1
        case .south:
            coordinates.y -= 1
        case .west:
            coordinates.x -= 1
        }
    }
    
    mutating func place(x: Int, y: Int, direction: Direction) {
        at(x: x, y: y)
        orient(direction)
    }
    
    mutating func evaluate(_ commands: String) {
        instructions(commands).forEach {
            switch $0 {
            case .advance:
                advance()
            case .turnLeft:
                turnLeft()
            case .turnRight:
                turnRight()
            }
        }
    }
    
    func instructions(_ instructions: String) -> [Command] {
        return instructions.compactMap { Command(rawValue: String($0)) }
    }
}

enum Direction: CaseIterable {
    case north
    case east
    case south
    case west
}

enum Command: String {
    case turnLeft = "L"
    case turnRight = "R"
    case advance = "A"
}

struct Coordinates: ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = Int

    init(arrayLiteral elements: Int...) {
        guard elements.count == 2 else { fatalError("Wrong coordinates!") }
        self.x = elements[0]
        self.y = elements[1]
    }

    var x: Int
    var y: Int
}

extension Coordinates: Equatable {}
