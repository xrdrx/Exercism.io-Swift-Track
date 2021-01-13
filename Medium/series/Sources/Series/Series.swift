//Solution goes in Sources
struct Series {
    private let serie: String
    
    init(_ serie: String) {
        self.serie = serie
    }
    
    func slices(_ length: Int) -> [[Int]] {
        return getValues(length, serie)
    }
    
    private func getValues(_ length: Int, _ line: String) -> [[Int]] {
        if line.count < length { return [[]] }
        return [line.prefix(length).compactMap { Int(String($0)) }] +
            getValues(length, String(line.dropFirst()))
    }
}
