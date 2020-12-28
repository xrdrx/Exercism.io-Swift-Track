//Solution goes in Sources
func isPangram(_ line: String) -> Bool {
    Set((97...122).map({ Character(UnicodeScalar($0)) })).isSubset(
        of: Set(line.lowercased()))
}
