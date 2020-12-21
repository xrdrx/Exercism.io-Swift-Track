//Solution goes in Sources
struct Sieve {
    private let range: Int
    
    var primes: [Int] {
        return calculatePrimes()
    }
    
    init(_ range: Int) {
        self.range = range
    }
    
    private func calculatePrimes() -> [Int] {
        var input = (2...range).map { $0 }
        var output: [Int] = []
        while !input.isEmpty {
            let value = input.removeFirst()
            output.append(value)
            input = input.filter { !$0.isMultiple(of: value) }
        }
        return output
    }
}
