//Solution goes in Sources
let total = UInt64.max

func square(_ input: Int) throws -> UInt64 {
    guard input < 65 else {
        throw GrainsError.inputTooHigh(message: "Input[\(input)] invalid. Input should be between 1 and 64 (inclusive)")
    }
    guard input > 0 else {
        throw GrainsError.inputTooLow(message: "Input[\(input)] invalid. Input should be between 1 and 64 (inclusive)")
    }
    
    return UInt64(1) << (input - 1)
}

enum GrainsError: Error {
    case inputTooHigh(message: String)
    case inputTooLow(message: String)
}
