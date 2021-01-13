//Solution goes in Sources
struct NumberSeries {
    private let serie: String
    
    init(_ serie: String) throws {
        self.serie = serie
    }
    
    func largestProduct(_ length: Int) throws -> Int {
        if length > serie.count { throw NumberSeriesError.spanLongerThanStringLength }
        if length < 0 {throw NumberSeriesError.negativeSpan }
        if serie.isEmpty || length == 0 { return 1 }
        
        var begin = serie.startIndex
        var end = serie.index(begin, offsetBy: length - 1)
        
        var best = 0
        while end < serie.endIndex {
            best = max(best, try serie[begin...end].reduce(1) { product, symbol in
                if let digit = Int(String(symbol)) {
                    return product * digit
                } else {
                    throw NumberSeriesError.invalidCharacter
                }
            })
            begin = serie.index(begin, offsetBy: 1)
            end = serie.index(end, offsetBy: 1)
        }
        return best
    }
    
    enum NumberSeriesError: Error {
        case spanLongerThanStringLength
        case invalidCharacter
        case negativeSpan
    }
}
