//Solution goes in Sources
import Foundation

func isValid(_ input: String) -> Bool {
    guard input.count >= 10 else { return false }
    let isbn = input.filter { $0.isNumber || $0.isLetter }
    guard isbn.range(of: #"\d{9}(?:\d|X){1}$"#, options: .regularExpression) != nil else { return false }
    
    return isbn.enumerated().reduce(0) { (result, value) in
        if value.element == "X" {
            return result + 10
        } else {
            return result + (Int(String(value.element))! * (10 - value.offset))
        }
    } % 11 == 0
}
