//Solution goes in Sources
func toLimit(_ limit: Int, inMultiples input: [Int]) -> Int {
    return
        (0..<limit).reduce(into: 0) { result, value in
            if input.first(where: { value.isMultiple(of: $0) }) != nil {
                result += value
            }
        }
}
