//Solution goes in Sources
struct Prime {
    static func nth(_ n: Int) -> Int? {
        guard n > 0 else { return nil }

        var counter = 0
        var currentNumber = 0
        while counter < n {
            currentNumber += 1
            if isPrime(currentNumber) {
                counter += 1
            }
        }
        return currentNumber
    }
    
    private static func isPrime(_ n: Int) -> Bool {
        if n <= 1 { return false }
        if n <= 3 { return true }
        if n % 2 == 0 || n % 3 == 0 { return false }
        
        var i = 5
        while i * i <= n {
            if n % i == 0 || n % (i + 2) == 0 {
                return false
            }
            i += 6
        }
        return true
    }
}
