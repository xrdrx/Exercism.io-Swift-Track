//Solution goes in Sources
struct SecretHandshake: OptionSet {
    static let wink          = Self(rawValue: 1 << 0)
    static let doubleBlink   = Self(rawValue: 1 << 1)
    static let closeYourEyes = Self(rawValue: 1 << 2)
    static let jump          = Self(rawValue: 1 << 3)
    static let reverse       = Self(rawValue: 1 << 4)
    
    let rawValue: Int
    
    var commands: [String] {
        return getCommands()
    }
    
    init(_ number: Int) {
        self.rawValue = number
    }
    
    init(rawValue: Int) {
        self.init(rawValue)
    }
    
    private func getCommands() -> [String] {
        var result: [String] = []
        if self.contains(.wink) {
            result.append(Self.wink.description)
        }
        if self.contains(.doubleBlink) {
            result.append(Self.doubleBlink.description)
        }
        if self.contains(.closeYourEyes) {
            result.append(Self.closeYourEyes.description)
        }
        if self.contains(.jump) {
            result.append(Self.jump.description)
        }
        if self.contains(.reverse) {
            result.reverse()
        }
        return result
    }
}

extension SecretHandshake: CustomStringConvertible {
    var description: String {
        switch self {
        case .wink:
            return "wink"
        case .doubleBlink:
            return "double blink"
        case .closeYourEyes:
            return "close your eyes"
        case .jump:
            return "jump"
        default:
            return ""
        }
    }
}
