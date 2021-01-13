//Solution goes in Sources
struct OCR {
    private static let digitHeight = 4
    private static let digitWidth = 3
    
    let splitInput: [String]
    
    init(_ text: String) throws {
        let split = text.split(separator: "\n").map({ String($0) })
        guard split.count.isMultiple(of: OCR.digitHeight) else {
            throw OCRError.invalidNumberOfLines
        }
        guard let first = split.first, first.count.isMultiple(of: OCR.digitWidth) else {
            throw OCRError.invalidNumberOfColumns
        }
        self.splitInput = split
    }
    
    func converted() throws -> String {
        let splitted = splitByLines(splitInput)
        let separated = splitted.map({ separateToArray($0) })
        return separated.map({
            $0.compactMap({ Number(rawValue: $0)?.description ?? "?" })
                .joined()
        }).joined(separator: ",")
    }
    
    private func splitByLines(_ input: [String]) -> [[String]] {
        let parts = input.count / OCR.digitHeight
        if parts == 1 { return [input] }
        var output: [[String]] = []
        var i = 0
        while i < input.count {
            output.append(Array(input[i..<i + input.count / parts]))
            i += input.count / parts
        }
        return output
    }
    
    private func separateToArray(_ input: [String]) -> [String] {
        let input = Array(input.joined())
        var output: [String] = []
        var i = 0
        var j = 0
        var buffer: [String] = []
        while j < input.count / OCR.digitHeight {
            while i < input.count {
                buffer.append(String( input[(j + i)..<(j + i + 3)] ))
                i += input.count / OCR.digitHeight
            }
            output.append(buffer.joined(separator: "\n"))
            buffer.removeAll()
            i = 0
            j += OCR.digitWidth
        }
        return output
    }
}

extension OCR {
    enum OCRError: Error {
        case invalidNumberOfLines
        case invalidNumberOfColumns
    }
}

enum Number: String {
    case zero  = " _ \n| |\n|_|\n   "
    case one   = "   \n  |\n  |\n   "
    case two   = " _ \n _|\n|_ \n   "
    case three = " _ \n _|\n _|\n   "
    case four  = "   \n|_|\n  |\n   "
    case five  = " _ \n|_ \n _|\n   "
    case six   = " _ \n|_ \n|_|\n   "
    case seven = " _ \n  |\n  |\n   "
    case eight = " _ \n|_|\n|_|\n   "
    case nine  = " _ \n|_|\n _|\n   "
}

extension Number: CustomStringConvertible {
    var description: String {
        switch self {
        case .zero:  return "0"
        case .one:   return "1"
        case .two:   return "2"
        case .three: return "3"
        case .four:  return "4"
        case .five:  return "5"
        case .six:   return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine:  return "9"
        }
    }
}
