//Solution goes in Sources
import Foundation

let nothingToChange = #"(?<=^)(?:a|e|xr|yt)"#
let matchToEnd = #"(?<=^)(?:ch|qu|squ|thr|th|sch)"#
let firstFromMatchToEnd = #"(?<=^)(?:ye|xe|f|r|p|k)"#

func translate(_ input: String) -> String {
    input.split(separator: " ").map({ convertWord(String($0)) }).joined(separator: " ")
}

private func convertWord(_ input: String) -> String {
    var output = ""
    if input.range(of: nothingToChange, options: .regularExpression) != nil {
        output = input
    }
    if let prefixRange = input.range(of: matchToEnd, options: .regularExpression) {
        output = String(input[prefixRange.upperBound..<input.endIndex] + input[prefixRange])
    }
    if input.range(of: firstFromMatchToEnd, options: .regularExpression) != nil {
        output = input.dropFirst() + String(input.first!)
    }
    return output + "ay"
}
