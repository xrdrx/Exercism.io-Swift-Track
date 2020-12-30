//Solution goes in Sources
func encode(_ input: String) -> String {
    var buffer = ""
    var output = ""
    var previous = ""
    for symbol in input {
        if String(symbol) != previous {
            output.append(encodeOneSymbol(buffer))
            buffer.removeAll()
            previous = String(symbol)
        }
        buffer += String(symbol)
    }
    output.append(encodeOneSymbol(buffer))
    return output
}

func decode(_ input: String) -> String {
    var count = ""
    var output = ""
    for symbol in input {
        if symbol.isNumber {
            count += String(symbol)
        } else {
            output += String(repeating: symbol, count: Int(count) ?? 1)
            count.removeAll()
        }
    }
    return output
}

private func encodeOneSymbol(_ symbol: String) -> String {
    if symbol.count < 2 { return symbol }
    return "\(symbol.count)\(symbol.first!)"
}
