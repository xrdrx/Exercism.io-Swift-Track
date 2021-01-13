//Solution goes in Sources
func compute(_ first: String, against second: String) -> Int? {
    guard first.count == second.count else { return nil }
    return zip(first, second).filter({ $0.0 != $0.1 }).count
}
