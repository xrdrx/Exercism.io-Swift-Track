//Solution goes in Sources
struct PhoneNumber {
    var number: String {
        return "\(areaCode)\(rawNumber)"
    }
    private(set) var areaCode: String
    
    private var rawNumber: String
    
    init(_ number: String) {
        var number = number.filter { $0.isNumber }
        if number.first == "1" { number.removeFirst(1) }
        if number.count != 10 {
            self.rawNumber = "0000000"
            self.areaCode = "000"
        } else {
            self.rawNumber = String(number.suffix(7))
            self.areaCode = String(number.prefix(3))
        }
    }
}

extension PhoneNumber: CustomStringConvertible {
    var description: String {
        return "(\(areaCode)) \(rawNumber.prefix(3))-\(rawNumber.suffix(4))"
    }
}
