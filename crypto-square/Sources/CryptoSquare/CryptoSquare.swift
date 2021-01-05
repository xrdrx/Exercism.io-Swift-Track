//Solution goes in Sources
import Foundation

class Crypto {
    private let input: String
    lazy var normalizePlaintext: String = {
        return normalize(input)
    }()
    lazy var size: Int = {
        return getSize()
    }()
    lazy var plaintextSegments: [String] = {
        return getSegments()
    }()
    lazy var ciphertext: String = {
        return getCiphertext()
    }()
    lazy var normalizeCiphertext: String = {
        return getNormalizedCiphertext()
    }()
    
    init(_ input: String) {
        self.input = input
    }
    
    private func normalize(_ input: String) -> String {
        return input.filter({ $0.isNumber || $0.isLetter }).lowercased()
    }
    
    private func getSize() -> Int {
        return Int(sqrt(Double(normalizePlaintext.count)).rounded(.up))
    }
    
    private func getSegments() -> [String] {
        normalizePlaintext.toSubstringArray(ofSize: size)
    }
    
    private func getCiphertext() -> String {
        var output = ""
        for i in 0..<size {
            for segment in plaintextSegments {
                if i < segment.count {
                    let index = segment.index(segment.startIndex, offsetBy: i)
                    output += String(segment[index])
                }
            }
        }
        return output
    }
    
    private func getNormalizedCiphertext() -> String {
        let fullLines = size * size > ciphertext.count ? size - 1: size
        return ciphertext.toSubstringArray(ofSize: fullLines).joined(separator: " ")
    }
}

extension String {
    func toSubstringArray(ofSize size: Int) -> [Self] {
        var output: [Self] = []
        var buffer = ""
        var counter = 0
        for symbol in self {
            buffer += String(symbol)
            counter += 1
            if counter.isMultiple(of: size) {
                output.append(buffer)
                buffer.removeAll()
            }
        }
        if !buffer.isEmpty { output.append(buffer) }
        return output
    }
}
