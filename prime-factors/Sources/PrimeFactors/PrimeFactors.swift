//Solution goes in Sources
struct PrimeFactors {
    private let value: Int
    
    var toArray: [Int] {
        return getPrimeFactors()
    }
    
    init(_ value: Int) {
        self.value = value
    }
    
    func getPrimeFactors() -> [Int] {
        var value = self.value
        var factor = 2
        var output: [Int] = []
        while value > 1 {
            if value.isMultiple(of: factor) {
                output.append(factor)
                value = value / factor
            } else {
                factor += 1
            }
        }
        return output
    }
}
