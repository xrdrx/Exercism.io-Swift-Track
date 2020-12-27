//Solution goes in Sources
struct Base {
    static func outputDigits(inputBase: Int, inputDigits: [Int], outputBase: Int) throws -> [Int] {
        guard inputBase > 1 else { throw BaseError.invalidInputBase }
        guard outputBase > 1 else { throw BaseError.invalidOutputBase }
        
        var result = 0
        for digit in inputDigits {
            if digit < 0 { throw BaseError.negativeDigit }
            if digit >= inputBase { throw BaseError.invalidPositiveDigit }
            result = result * inputBase + digit
        }
        var output: [Int] = []
        while result > 0 {
            output.append(result % outputBase)
            result /= outputBase
        }
        return output.reversed()
    }
}

enum BaseError: Error {
    case negativeDigit
    case invalidPositiveDigit
    case invalidInputBase
    case invalidOutputBase
}
