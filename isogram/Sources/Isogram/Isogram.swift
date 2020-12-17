//Solution goes in Sources
func isIsogram(_ word: String) -> Bool {
    var lettersSeen: Set<String> = []
    
    for symbol in word {
        guard symbol.isLetter else { continue }
        
        let letter = String(symbol).lowercased()
        
        if lettersSeen.contains(letter) { return false }
        lettersSeen.insert(letter)
    }
    return true
}
