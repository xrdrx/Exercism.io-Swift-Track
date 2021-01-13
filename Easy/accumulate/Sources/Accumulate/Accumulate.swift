//Solution goes in Sources
extension Collection {
    func accumulate<T>(_ function: (Element) -> T) -> [T] {
        var result: [T] = []
        for value in self {
            result.append(function(value))
        }
        return result
    }
}
