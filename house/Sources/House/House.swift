//Solution goes in Sources
func recite() -> String {
    let verses = constructVerses()
    return verses.map({ $0.recite() }).joined(separator: "\n\n")
}

let items = [
    "house that Jack built.",
    "malt",
    "rat",
    "cat",
    "dog",
    "cow with the crumpled horn",
    "maiden all forlorn",
    "man all tattered and torn",
    "priest all shaven and shorn",
    "rooster that crowed in the morn",
    "farmer sowing his corn",
    "horse and the hound and the horn"
]

let actions = [
    "lay in",
    "ate",
    "killed",
    "worried",
    "tossed",
    "milked",
    "kissed",
    "married",
    "woke",
    "kept",
    "belonged to",
    ""
]

private func constructVerses() -> [Verse] {
    var output: [Verse] = []
    let values = Array(zip(items, actions))
    for i in 0..<values.count {
        var verse = Verse()
        verse.addLine(IntroductionLine(item: values[i].0))
        if i > 0 {
            for j in stride(from: i - 1, through: 0, by: -1) {
                verse.addLine(ActionLine(item: values[j].0, action: values[j].1))
            }
        }
        output.append(verse)
    }
    return output
}

struct Verse {
    private(set) var lines: [Line] = []
    
    func recite() -> String {
        lines.map({ $0.getLine() }).joined(separator: "\n")
    }
    
    mutating func addLine(_ line: Line) {
        lines.append(line)
    }
}

protocol Line {
    func getLine() -> String
}

struct IntroductionLine: Line {
    let item: String
    
    func getLine() -> String {
        "This is the \(item)"
    }
}

struct ActionLine: Line {
    let item: String
    let action: String
    
    func getLine() -> String {
        "that \(action) the \(item)"
    }
}
