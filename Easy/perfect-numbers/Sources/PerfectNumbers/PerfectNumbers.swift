//Solution goes in Sources
class NumberClassifier {
    private let number: Int
    
    var classification: NumberClass {
        return classify()
    }
    
    init(number: Int) {
        self.number = number
    }
    
    private func classify() -> NumberClass {
        let rangeOfFactors = number / 2
        var factorsSum = 0
        
        for factor in 1...rangeOfFactors {
            if number % factor == 0 {
                factorsSum += factor
            }
        }
        
        if factorsSum == number {
            return .perfect
        } else if factorsSum < number {
            return .deficient
        } else {
            return .abundant
        }
    }
}

enum NumberClass {
    case perfect
    case abundant
    case deficient
}
