//Solution goes in Sources
struct Allergies: OptionSet {
    let rawValue: UInt
    static let eggs =         Allergies(1 << 0)
    static let peanuts =      Allergies(1 << 1)
    static let shellfish =    Allergies(1 << 2)
    static let strawberries = Allergies(1 << 3)
    static let tomatoes =     Allergies(1 << 4)
    static let chocolate =    Allergies(1 << 5)
    static let pollen =       Allergies(1 << 6)
    static let cats =         Allergies(1 << 7)

    init(_ value: UInt) {
        self.init(rawValue: value)
    }
    
    init(rawValue: UInt) {
        self.rawValue = rawValue
    }
    
    func hasAllergy(_ allergy: Allergies) -> Bool {
        return self.contains(allergy)
    }
}
