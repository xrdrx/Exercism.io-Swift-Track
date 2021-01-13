//Solution goes in Sources
func hey(_ input: String) -> String {
    switch true {
    case input.isEmpty || input.allSatisfy({ $0.isWhitespace }):
        return "Fine. Be that way!"
    case (input.contains(where: { $0.isLetter && $0.isUppercase })
            && !input.contains(where: { $0.isLetter && $0.isLowercase })):
        return "Whoa, chill out!"
    case input.last == "?":
        return "Sure."
    default:
        return "Whatever."
    }
}
