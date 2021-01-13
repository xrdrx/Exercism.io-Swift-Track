//Solution goes in Sources
struct RomanNumeral: LosslessStringConvertible {
    private let numerals: [(value: Int, letter: String)] = [
        (1000, "M"),
        (500,  "D"),
        (100,  "C"),
        (50,   "L"),
        (10,   "X"),
        (5,    "V"),
        (1,    "I")
    ]
    private(set) var description: String
    private let digit: Int
    
    init(_ digit: Int) {
        self.digit = digit
        self.description = ""
        getNumberInRoman()
    }
    
    init?(_ description: String) {
        self.description = description
        self.digit = Int(description) ?? 0
    }
    
    private mutating func getNumberInRoman() {
        var digit = self.digit
        var devider = 1_000
        while devider > 0 {
            description += convertDecimal(digit / devider * devider)
            digit = digit % devider
            devider /= 10
        }
    }
    
    private func convertDecimal(_ number: Int) -> String {
        guard number > 0 else { return "" }

        var previous = (value: 0, letter: "")
        for (value, letter) in numerals {
            if number < value {
                previous = (value, letter)
                continue
            }
            if number == value { return letter }
            if numerals.contains(where: { $0.value == previous.value - number }) {
                return convertDecimal(previous.value - number) + previous.letter
            }
            return letter + convertDecimal(number - value)
        }
        return ""
    }
}
