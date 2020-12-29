//Solution goes in Sources
struct Squares {
    private let number: Int
    
    var squareOfSum: Int {
        let sum = (0...number).reduce(0, +)
        return sum * sum
    }
    
    var sumOfSquares: Int {
        return (0...number).reduce(0, { $0 + $1 * $1 })
    }
    
    var differenceOfSquares: Int {
        return squareOfSum - sumOfSquares
    }
    
    init(_ number: Int) {
        self.number = number
    }
}
