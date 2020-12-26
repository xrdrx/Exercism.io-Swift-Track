//Solution goes in Sources
struct Anagram {
    private let word: String
    
    init(word: String) {
        self.word = word
    }
    
    func match(_ words: [String]) -> [String] {
        return words.filter { isAnagrams(word, $0) && !equal(word, $0) }
    }
    
    private func isAnagrams(_ first: String, _ second: String) -> Bool {
        var letterCountFirst: [String: Int] = [:]
        var letterCountSecond: [String: Int] = [:]
        first.forEach { letterCountFirst[$0.lowercased(), default: 0] += 1 }
        second.forEach { letterCountSecond[$0.lowercased(), default: 0] += 1 }
        return letterCountFirst == letterCountSecond
    }
    
    private func equal(_ first: String, _ second: String) -> Bool {
        return first.lowercased() == second.lowercased()
    }
}
