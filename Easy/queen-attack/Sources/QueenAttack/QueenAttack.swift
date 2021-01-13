//Solution goes in Sources
struct Queens {
    let white: [Int]
    let black: [Int]
    
    private static let validCoordinates = 0...7
    
    var description: String {
        return getDescription()
    }
    
    var canAttack: Bool {
        let dx = abs(white[0] - black[0])
        let dy = abs(white[1] - black[1])
        return dx == 0 || dy == 0 || dx == dy
    }
    
    init(white: [Int] = [0, 3], black: [Int] = [7, 3]) throws {
        guard white.count == 2, black.count == 2 else {
            throw InitError.incorrectNumberOfCoordinates
        }
        guard (white + black).allSatisfy({ Queens.validCoordinates.contains($0) }) else {
            throw InitError.invalidCoordinates
        }
        guard white != black else {
            throw InitError.sameSpace
        }
        
        self.white = white
        self.black = black
    }
    
    private func getDescription() -> String {
        return
            Queens.validCoordinates
            .map { row in
                Queens.validCoordinates
                    .map { column in
                        switch [row, column] {
                        case white: return "W"
                        case black: return "B"
                        default: return "_"
                        }
                    }.joined(separator: " ")
            }.joined(separator: "\n")
    }
    
    enum InitError: Error {
        case incorrectNumberOfCoordinates
        case invalidCoordinates
        case sameSpace
    }
}
