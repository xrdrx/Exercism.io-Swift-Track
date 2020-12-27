//Solution goes in Sources
struct Matrix {
    var rows: [[Int]]
    var columns: [[Int]]
    
    init(_ matrix: String) {
        self.rows = matrix
            .split(separator: "\n")
            .map { $0.split(separator: " ").compactMap { Int(String($0)) } }
        self.columns = []
        self.columns = (0..<rows[0].count)
            .map { index in rows.map { $0[index] }
        }
    }
}
