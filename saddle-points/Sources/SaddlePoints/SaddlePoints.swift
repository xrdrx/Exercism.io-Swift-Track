//Solution goes in Sources
struct SaddlePointsMatrix {
    private(set) var rows: [[Int]]
    private(set) var columns: [[Int]]
    var saddlePoints: [[Int]] {
        return getSaddlePoints()
    }
    
    init(_ input: String) {
        self.rows = input
            .split(separator: "\n")
            .map({
                $0.split(separator: " ")
                .compactMap({ Int($0) })
            })
        self.columns = []
        var column: [Int] = []
        for i in 0..<rows[0].count {
            for row in rows {
                column.append(row[i])
            }
            columns.append(column)
            column.removeAll()
        }
    }
    
    private func getSaddlePoints() -> [[Int]] {
        var output: [[Int]] = []
        for row in 0..<rows.count {
            for column in 0..<columns.count {
                if isSaddlePoint(row: row, column: column) {
                    output.append([row, column])
                }
            }
        }
        return output
    }
    
    private func isSaddlePoint(row: Int, column: Int) -> Bool {
        guard let rowMax = rows[row].max(),
              let columnMin = columns[column].min()
        else {
            return false
        }
        return rows[row][column] == rowMax && rows[row][column] == columnMin
    }
}
