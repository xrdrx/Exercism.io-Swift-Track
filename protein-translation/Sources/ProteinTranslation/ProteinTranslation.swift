//Solution goes in Sources
func translationOfCodon(_ codon: String) throws -> String {
    guard let protein = proteinForCodon[codon] else { throw Errors.noTranslation }
    return protein
}

func translationOfRNA(_ RNA: String) throws -> [String] {
    try RNA
        .enumerated()
        .map { $0.offset.isMultiple(of: 3) ? ",\($0.element)" : "\($0.element)" }
        .joined()
        .split(separator: ",")
        .map { try translationOfCodon(String($0)) }
        .prefix { $0 != "STOP" }
}

let proteinForCodon = [
    "AUG": "Methionine",
    "UUU": "Phenylalanine",
    "UUC": "Phenylalanine",
    "UUA": "Leucine",
    "UUG": "Leucine",
    "UCU": "Serine",
    "UCC": "Serine",
    "UCA": "Serine",
    "UCG": "Serine",
    "UAU": "Tyrosine",
    "UAC": "Tyrosine",
    "UGU": "Cysteine",
    "UGC": "Cysteine",
    "UGG": "Tryptophan",
    "UAA": "STOP",
    "UAG": "STOP",
    "UGA": "STOP"
]

enum Errors: Error {
    case noTranslation
}
