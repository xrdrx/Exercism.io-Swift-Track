//Solution goes in Sources
struct Luhn {
    private let value: String
    
    var isValid: Bool {
        return validate()
    }
    
    init(_ value: String) {
        self.value = value
    }
    
    private func validate() -> Bool {
        var output = 0
        var counter = 0
        for symbol in value.reversed() {
            if let digit = symbol.wholeNumberValue {
                output += digit
                if counter % 2 == 1 {
                    output += digit
                    if digit * 2 > 9 { output -= 9 }
                }
                counter += 1
            } else if symbol != " " {
                return false
            }
        }
        if counter < 2 { return false }
        return output.isMultiple(of: 10)
    }
}
