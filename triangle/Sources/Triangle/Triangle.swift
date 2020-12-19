//Solution goes in Sources
struct Triangle {
    private let sides: [Double]
    
    var kind: String {
        return getKind().rawValue
    }
    
    init(_ firstSide: Double, _ secondSide: Double, _ thirdSide: Double) {
        self.sides = [firstSide, secondSide, thirdSide].sorted()
    }
    
    private func getKind() -> TriangleKind {
        guard isValid() else { return .error }

        let numberOfUniqueSides = Set(sides).count
        
        return kindWithUniqueSides(equalTo: numberOfUniqueSides)
    }
    
    private func isValid() -> Bool {
        return sidesArePositive() && sumOfLengthsIsValid()
    }
    
    private func sidesArePositive() -> Bool {
        return sides.reduce(true) { $0 && ($1 > 0) }
    }
    
    private func sumOfLengthsIsValid() -> Bool {
        return (sides[0] + sides[1]) >= sides[2]
    }
    
    private func kindWithUniqueSides(equalTo number: Int) -> TriangleKind {
        switch number {
        case 1:
            return .equilateral
        case 2:
            return .isosceles
        case 3:
            return .scalene
        default:
            fatalError("Wrong number of sides")
        }
    }
}

enum TriangleKind: String {
    case equilateral = "Equilateral"
    case isosceles = "Isosceles"
    case scalene = "Scalene"
    case error = "ErrorKind"
}
