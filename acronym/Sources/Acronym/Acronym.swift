//Solution goes in Sources
import Foundation

func abbreviate(_ input: String) -> String {
    let nsrange = NSRange(input.startIndex..<input.endIndex, in: input)
    let pattern = #"(?<=^|\W|[a-z])[A-Z]|(?<=\W)[a-z]"#
    let regex = try! NSRegularExpression(pattern: pattern, options: [])
    let matches = regex.matches(in: input, options: [], range: nsrange)
    return matches.reduce("") { $0 + input[Range($1.range, in: input)!].uppercased() }
}
