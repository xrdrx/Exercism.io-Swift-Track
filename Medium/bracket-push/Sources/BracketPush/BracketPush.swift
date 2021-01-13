//Solution goes in Sources

func paired(text: String) -> Bool {
    let opening: [Character] = ["[", "{", "("]
    let closing: [Character] = ["]", "}", ")"]
    var lastOpen: [Character] = []
    for symbol in text {
        if opening.contains(symbol) {
            lastOpen.append(symbol)
        }
        if closing.contains(symbol) {
            if lastOpen.isEmpty { return false }
            if opening.index(of: lastOpen.removeLast()) != closing.index(of: symbol) {
                return false
            }
        }
    }
    return lastOpen.isEmpty
}
