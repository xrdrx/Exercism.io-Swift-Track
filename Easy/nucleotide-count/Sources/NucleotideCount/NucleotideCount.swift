//Solution goes in Sources
class DNA {
    static let adenine = "A"
    static let cytosine = "C"
    static let guanine = "G"
    static let thymine = "T"
    
    private let strand: String
    private lazy var symbolsCount = [DNA.adenine: 0, DNA.cytosine: 0, DNA.guanine: 0, DNA.thymine: 0]
    
    init?(strand: String) {
        let symbols = Set([DNA.adenine, DNA.cytosine, DNA.guanine, DNA.thymine].joined())
        let strandSymbols = Set(strand)
        guard strandSymbols.isSubset(of: symbols) else { return nil }
        
        self.strand = strand
    }
    
    func count(_ symbol: String) -> Int {
        let char = Character(symbol)
        return strand.filter { $0 == char }.count
    }
    
    func counts() -> [String: Int] {
        countAll()
        return symbolsCount
    }
    
    private func countAll() {
        symbolsCount.keys.forEach {
            symbolsCount[$0] = count($0)
        }
    }
}

