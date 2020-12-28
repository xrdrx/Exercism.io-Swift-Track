//Solution goes in Sources
struct PalindromeProducts {
    private let maxFactor: Int
    private let minFactor: Int
    
    private(set) var largest: Palindrome
    private(set) var smallest: Palindrome
    
    init(maxFactor: Int, minFactor: Int = 1) {
        self.maxFactor = maxFactor
        self.minFactor = minFactor
        self.largest = Palindrome(value: Int.min, factor: [])
        self.smallest = Palindrome(value: Int.max, factor: [])
        calculatePalindromes()
    }
    
    private func generateFactors() -> [(Int, Int)] {
        var input = (minFactor...maxFactor).map { $0 }
        var output: [(Int, Int)] = []
        while !input.isEmpty {
            let first = input.first!
            output += input.map { (first, $0) }
            input = Array(input.dropFirst())
        }
        return output
    }
    
    private mutating func calculatePalindromes() {
        let factors = generateFactors()
        for (m, n) in factors {
            let value = m * n
            if !isPalindrome(value) { continue }
            if largest.value < value { largest = Palindrome(value: value, factor: [m, n]) }
            if smallest.value > value { smallest = Palindrome(value: value, factor: [m, n]) }
        }
    }
    
    private func isPalindrome(_ number: Int) -> Bool {
        return String(number) == String(String(number).reversed())
    }
}

struct Palindrome {
    let value: Int
    let factor: [Int]
}
