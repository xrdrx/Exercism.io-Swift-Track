//Solution goes in Sources
func makeDiamond(letter: String) -> [String] {
    let letterA: Unicode.Scalar = "A"
    let letterInput = Unicode.Scalar(letter)
    let size = letterInput!.value - letterA.value
    var result: [String] = []
    let sideTemplate = Array(repeating: " ", count: Int(size))
    for i in 0...size {
        let letter = String(UnicodeScalar(letterA.value + i)!)
        var side = sideTemplate
        side.insert(letter, at: Int(i))
        result.append((side.reversed().dropLast() + side).joined())
    }
    result += result.reversed().dropFirst()
    return result
}
