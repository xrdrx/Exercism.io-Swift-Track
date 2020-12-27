//Solution goes in Sources
import Foundation

func abbreviate(_ input: String) -> String {
    var output = ""
    let nsrange = NSRange(input.startIndex..<input.endIndex, in: input)
    let pattern = #"(?<=^|\W|[a-z])[A-Z]|(?<=\W)[a-z]"#
    let regex = try! NSRegularExpression(pattern: pattern, options: [])
    regex.enumerateMatches(in: input, options: [], range: nsrange) { (result, flags, stop) in
        if let result = result {
            let range = Range(result.range, in: input)!
            output += input[range]
        }
    }
    return output.uppercased()
}
