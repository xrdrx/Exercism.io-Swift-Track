//Solution goes in Sources
func steps(_ number: Int) throws -> Int {
    guard number > 0 else { throw Errors.incorrectInput }
    var output = number
    var count = 0
    while output > 1 {
        if output.isMultiple(of: 2) {
            output /= 2
        } else {
            output = output * 3 + 1
        }
        count += 1
    }
    return count
}

enum Errors: Error {
    case incorrectInput
}
