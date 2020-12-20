//Solution goes in Sources
struct WordCount {
    private let words: String
    
    init(words: String) {
        self.words = words
    }
    
    func count() -> [String: Int] {
        var dict: [String: Int] = [:]
        var currentWord: String = ""
        
        for symbol in words {
            if symbol.isLetter || symbol.isNumber {
                currentWord += String(symbol)
            } else if !currentWord.isEmpty {
                dict[currentWord.lowercased(), default: 0] += 1
                currentWord = ""
            }
        }
        if !currentWord.isEmpty {
            dict[currentWord.lowercased(), default: 0] += 1
        }
        
        return dict
    }
}
