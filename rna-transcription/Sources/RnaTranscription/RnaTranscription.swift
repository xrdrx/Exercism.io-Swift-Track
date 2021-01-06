//Solution goes in Sources
struct Nucleotide {
    private let input: String
    
    init(_ input: String) {
        self.input = input
    }
    
    func complementOfDNA() throws -> String {
        return try input.reduce("", { $0 + (try transcriptNucleotide($1)) })
    }
    
    private func transcriptNucleotide(_ nucleotide: Character) throws -> String {
        switch nucleotide {
        case "G": return "C"
        case "C": return "G"
        case "T": return "A"
        case "A": return "U"
        default:
            throw TranscriptionError.invalidNucleotide("\(nucleotide) is not a valid Nucleotide")
        }
    }
}

enum TranscriptionError: Error {
    case invalidNucleotide(_ message: String)
}
