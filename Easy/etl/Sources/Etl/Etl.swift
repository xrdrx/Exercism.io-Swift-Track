//Solution goes in Sources
class ETL {
    static func transform(_ data: [Int: [String]]) -> [String: Int] {
        return data.reduce(into: [:]) { result, scoreLetterPair in
            scoreLetterPair.value.forEach {
                result[$0.lowercased()] = scoreLetterPair.key
            }
        }
    }
}

