//Solution goes in Sources
struct WordProblem {
    private let input: String
    
    init(_ input: String) {
        self.input = input
    }
    
    func answer() throws -> Int? {
        if let result = parse(input) { return result }
        throw ExpressionError.invalidExpression
    }
    
    private func parse(_ input: String) -> Int? {
        var currentOperator: ((Int, Int) -> Int)? = nil
        let output = input
            .dropLast()
            .split(separator: " ")
            .reduce(0, {
                if let digit = Int($1) {
                    if let function = currentOperator {
                        return function($0, digit)
                    } else {
                        return $0 + digit
                    }
                }
                switch $1 {
                case "plus":       currentOperator = (+)
                case "minus":      currentOperator = (-)
                case "multiplied": currentOperator = (*)
                case "divided":    currentOperator = (/)
                default: break
                }
                return $0
            })
        if currentOperator != nil { return output }
        return nil
    }
}

extension WordProblem {
    enum ExpressionError: Error {
        case invalidExpression
    }
}
