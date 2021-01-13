//Solution goes in Sources
struct ScaleGenerator {
    static let pitchesAscending = ["A", "A#", "B", "C", "C#", "D", "D#", "E", "F", "F#", "G","G#"]
    static let pitchesDescending = ["Ab", "A", "Bb", "B", "C", "Db", "D", "Eb", "E", "F", "Gb", "G"]
    
    let tonic: String
    let scaleName: String
    let pattern: String
    var name: String {
        return "\(tonicNormalized()) \(scaleName)"
    }
    
    init(tonic: String, scaleName: String, pattern: String = "mmmmmmmmmmmm") {
        self.tonic = tonic
        self.scaleName = scaleName
        self.pattern = pattern
    }
    
    func pitches() -> [String] {
        let scale = getScale()
        guard var index = findTonicIndex(in: scale) else { return [] }
        let count = scale.count
        var output: [String] = []
        for step in pattern {
            output.append(scale[index % count])
            index += getInterval(step)
        }
        return output
    }
    
    private func findTonicIndex(in scale: [String]) -> Int? {
        return scale.index(of: tonicNormalized())
    }
    
    private func tonicNormalized() -> String {
        guard let first = tonic.first else { return "" }
        return first.uppercased() + tonic.dropFirst()
    }
    
    private func getScale() -> [String] {
        switch tonic {
        case "F", "Bb", "Eb", "Ab", "Db", "Gb", "d", "g", "c", "f", "bb", "eb":
            return ScaleGenerator.pitchesDescending
        default:
            return ScaleGenerator.pitchesAscending
        }
    }
    
    private func getInterval(_ step: Character) -> Int {
        switch step {
        case "A": return 3
        case "M": return 2
        default: return 1
        }
    }
}


