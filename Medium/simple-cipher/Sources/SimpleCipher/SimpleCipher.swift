//Solution goes in Sources
struct Cipher {
    let key: String
    private let charAascii = Character("a").asciiValue!
    
    init?(key: String) {
        if key.isEmpty { return nil }
        for symbol in key {
            if !symbol.isLowercase { return nil }
            if !symbol.isLetter { return nil }
        }
        
        self.key = key
    }
    
    init() {
        self.key = "ddddddddddddddddd"
    }
    
    func encode(_ input: String) -> String {
        return code(input, adjust: encodeOffset(_:))
    }
    
    func decode(_ input: String) -> String {
        return code(input, adjust: decodeOffset(_:))
    }
    
    private func code(_ input: String, adjust: (UInt8) -> UInt8) -> String {
        input.indices.reduce("") {
            let offset = key[$1].asciiValue! - charAascii
            let newAscii = (input[$1].asciiValue! - charAascii + adjust(offset)) % 26 + charAascii
            return $0 + String(UnicodeScalar(newAscii))
        }
    }
    
    private func encodeOffset(_ offset: UInt8) -> UInt8 {
        offset
    }
    
    private func decodeOffset(_ offset: UInt8) -> UInt8 {
        26 - offset
    }
}
