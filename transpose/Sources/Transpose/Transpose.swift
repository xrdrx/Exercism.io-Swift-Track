//Solution goes in Sources
func transpose(_ input: [String]) -> [String] {
    let numberOfRows = input.reduce(into: 0) { $0 = max($0, $1.count) }
    var output: [String] = []
    var buffer = ""
    for offset in 0..<numberOfRows {
        for value in input {
            if offset < value.count {
                let index = value.index(value.startIndex, offsetBy: offset)
                buffer.append(value[index])
            } else {
                buffer.append(" ")
            }
        }
        buffer.removeTrailingWhitespaces()
        output.append(buffer)
        buffer.removeAll()
    }
    return output
}

extension String {
    mutating func removeTrailingWhitespaces() {
        for index in self.indices.reversed() {
            if self[index].isWhitespace {
                self.remove(at: index)
            } else {
                break
            }
        }
    }
}
