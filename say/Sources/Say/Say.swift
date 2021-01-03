//Solution goes in Sources

func say(_ input: Int) -> String? {
    guard input >= 0 else { return nil }
    guard input < 999_999_999_999 else { return nil }
    return NumberConverter.convert(input)
}

struct NumberConverter {
    private static let dictionary = [
        0:             "zero",
        1:             "one",
        2:             "two",
        3:             "three",
        4:             "four",
        5:             "five",
        6:             "six",
        7:             "seven",
        8:             "eight",
        9:             "nine",
        10:            "ten",
        11:            "eleven",
        12:            "twelve",
        13:            "thirteen",
        14:            "fourteen",
        15:            "fifteen",
        16:            "sixteen",
        17:            "seventeen",
        18:            "eighteen",
        19:            "nineteen",
        20:            "twenty",
        30:            "thirty",
        40:            "forty",
        50:            "fifty",
        60:            "sixty",
        70:            "seventy",
        80:            "eighty",
        90:            "ninety",
        100:           "hundred",
        1_000:         "thousand",
        1_000_000:     "million",
        1_000_000_000: "billion"
    ]
    
    static func convert(_ number: Int) -> String {
        var output = ""
        switch number {
        case 0...99:
            output += convertOneTwoDigitNumber(number)
        case 100...:
            let devider = getDevider(for: number)
            output += convert(number / devider) + " " + getSuffix(for: devider)
            if number % devider != 0 {
                output += " " + convert(number % devider)
            }
        default:
            output = "Error converting"
        }
        return output
    }
    
    private static func convertOneTwoDigitNumber(_ number: Int) -> String {
        if let result = dictionary[number] { return result }
        let hundred = number % 100
        let lastDigit = dictionary[hundred % 10]!
        let firstDigit = dictionary[hundred - (hundred % 10)]!
        return "\(firstDigit)-\(lastDigit)"
    }
    
    private static func getDevider(for number: Int) -> Int {
        switch number {
        case 100...999:
            return 100
        case 1_000...999_999:
            return 1_000
        case 1_000_000...999_999_999:
            return 1_000_000
        case 1_000_000_000...:
            return 1_000_000_000
        default:
            return 1
        }
    }
    
    private static func getSuffix(for devider: Int) -> String {
        dictionary[devider]!
    }
}
