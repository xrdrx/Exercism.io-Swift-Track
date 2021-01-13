//Solution goes in Sources
struct PascalsTriangle {
    private let numberOfRows: Int
    var rows: [[Int]] = [[]]
    
    init(_ numberOfRows: Int) {
        self.numberOfRows = numberOfRows
        self.rows = getRows(numberOfRows)
    }
    
    private func getRows(_ number: Int) -> [[Int]] {
        var output = [[1]]
        for i in 0..<number-1 {
            output.append(
                zip(output[i] + [0], [0] + output[i])
                    .map { $0 + $1 }
            )
        }
        return output
    }
}
