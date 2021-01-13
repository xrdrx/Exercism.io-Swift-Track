//Solution goes in Sources
class Scrabble {
    private let word: String?
    
    var score: Int {
        return scoreWord()
    }
    
    init(_ word: String?) {
        self.word = word
    }
    
    static func score(_ word: String) -> Int {
        return ScrabbleScore.score(word)
    }
    
    private func scoreWord() -> Int {
        guard let word = word else { return 0 }
        return ScrabbleScore.score(word)
    }
}

struct ScrabbleScore {
    private static let scores = ["G": 2, "L": 1, "W": 4, "B": 3, "M": 3, "I": 1, "C": 3, "X": 8, "O": 1, "U": 1, "Y": 4, "D": 2, "R": 1, "E": 1, "P": 3, "K": 5, "H": 4, "S": 1, "J": 8, "Q": 10, "T": 1, "A": 1, "N": 1, "V": 4, "F": 4, "Z": 10]
    
    static func score(_ symbol: Character) -> Int {
        return scores[String(symbol).uppercased()] ?? 0
    }
    
    static func score(_ word: String) -> Int {
        return word.reduce(0) {
            $0 + score($1)
        }
    }
}
