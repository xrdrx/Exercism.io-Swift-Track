//Solution goes in Sources
struct WordCount {
    private let words: String
    
    init(words: String) {
        self.words = words
    }
    
    func count() -> [String: Int] {
        return words
            .split { !$0.isLetter && !$0.isNumber }
            .reduce(into: [:]) { count, word in
                count[String(word).lowercased(), default: 0] += 1
            }
    }
}
