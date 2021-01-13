//Solution goes in Sources
extension Array where Element == String {
    func recite() -> Self.Element {
        guard !self.isEmpty else { return "" }
        var output = self
            .indices
            .dropFirst()
            .compactMap { getProverbLine(for: self[$0 - 1], and: self[$0]) }
        output.append(getLastProverbLine(for: self.first!))
        return output.joined(separator: "\n")
    }
    
    private func getProverbLine(for first: String, and second: String) -> String {
        return "For want of a \(first) the \(second) was lost."
    }
    
    private func getLastProverbLine(for item: String) -> String {
        return "And all for the want of a \(item)."
    }
}
