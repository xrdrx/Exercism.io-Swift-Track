//Solution goes in Sources
struct AtbashCipher {
    private static let alphabet = "abcdefghijklmnopqrstuvwxyz"
    
    static func encode(_ input: String) -> String {
        var buffer = ""
        var output: [String] = []
        for symbol in input {
            if !symbol.isPunctuation && !symbol.isWhitespace {
                buffer += String(symbol.lowercased())
            }
            if buffer.count == 5 {
                output.append(encoded(buffer))
                buffer.removeAll()
            }
        }
        if !buffer.isEmpty { output.append(encoded(buffer)) }
        return output.joined(separator: " ")
    }
    
    private static func encoded(_ input: String) -> String {
        input.reduce("") { result, symbol in
            if let index = alphabet.index(of: symbol) {
                return result + String(String(alphabet.reversed())[index])
            } else {
                return result + String(symbol)
            }
        }
    }
}
