//Solution goes in Sources
func rotate(_ input: String, ROT: UInt8) -> String {
    var output = ""
    for symbol in input {
        if !symbol.isLetter {
            output.append(symbol)
            continue
        }
        let asciiValue = UInt8(symbol.asciiValue!)
        var offset: UInt8 = 0
        if symbol.isUppercase { offset = 65 }
        if symbol.isLowercase { offset = 97 }
        output.append(String(UnicodeScalar((asciiValue - offset + ROT) % 26 + offset)))
    }
    return output
}
