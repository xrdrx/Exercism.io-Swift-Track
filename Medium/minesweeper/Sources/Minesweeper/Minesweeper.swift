//Solution goes in Sources
struct Board {
    private let field: [[String]]
    private let size: Coordinates
    private let mines: [Mine]
    
    init(_ input: [String]) throws {
        guard !input.isEmpty else {
            throw BoardError.emptyInput
        }
        guard input.allSatisfy({ $0.count == input[0].count }) else {
            throw BoardError.differentLength
        }
        guard (input.first! + input.last!).allSatisfy({ $0 == "+" || $0 == "-" }) else {
            throw BoardError.faultyBorder
        }
        guard input.dropFirst().dropLast().allSatisfy({ $0.first == "|" && $0.last == "|" }) else {
            throw BoardError.faultyBorder
        }
        
        let size = Coordinates(x: input[0].count, y: input.count)
        var mines: [Mine] = []
        self.field = try input
            .enumerated()
            .map({ row, values in
                    try values
                        .enumerated()
                        .map({ column, value in
                            if !["+", "-", "|", "*", " "].contains(value) {
                                throw BoardError.invalidCharacter
                            }
                            if value == "*" { mines.append(Mine(column, row, boardSize: size)) }
                            return String(value)
                        })
            })
        self.size = size
        self.mines = mines
    }
    
    func transform() -> [String] {
        var field = self.field
        let coordsToMark = removeMines(getMinesArea())
        let minesCount = coordsToMark.reduce(into: [:]) { dict, coords in
            dict[coords, default: 0] += 1
        }
        minesCount.forEach { coords, count in
            field[coords.y][coords.x] = "\(count)"
        }
        return field.map { $0.joined() }
    }
    
    private func getMinesArea() -> [Coordinates] {
        mines.flatMap { $0.getMineArea() }
    }
    
    private func removeMines(_ input: [Coordinates]) -> [Coordinates] {
        let minesCoords = mines.map { $0.coords }
        return input.filter { !minesCoords.contains($0) }
    }
    
}

extension Board {
    enum BoardError: Error {
        case emptyInput
        case differentLength
        case faultyBorder
        case invalidCharacter
    }
}

struct Mine {
    let coords: Coordinates
    let field: Field
    
    init(_ x: Int, _ y: Int, boardSize: Coordinates) {
        self.coords = Coordinates(x: x, y: y)
        self.field = Field(
            upperLeft: Coordinates(x: 1, y: 1),
            lowerRight: Coordinates(x: boardSize.x - 2, y: boardSize.y - 2)
        )
    }
    
    func getMineArea() -> [Coordinates] {
        var output: [Coordinates] = []
        for x in (coords.x - 1)...(coords.x + 1) {
            for y in (coords.y - 1)...(coords.y + 1) {
                let coords = Coordinates(x: x, y: y)
                if field.contains(coords) && coords != self.coords {
                    output.append(coords)
                }
            }
        }
        return output
    }
}

struct Field {
    let upperLeft: Coordinates
    let lowerRight: Coordinates
    
    func contains(_ coords: Coordinates) -> Bool {
        return
            (upperLeft.x...lowerRight.x).contains(coords.x) &&
            (upperLeft.y...lowerRight.y).contains(coords.y)
    }
}

struct Coordinates: Equatable, Hashable {
    let x: Int
    let y: Int
}
