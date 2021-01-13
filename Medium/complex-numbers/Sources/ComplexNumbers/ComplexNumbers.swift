//Solution goes in Sources
import Foundation

struct ComplexNumber {
    let realComponent: Double
    let imaginaryComponent: Double
    
    private let r: Double
    private let i: Double
    
    init(realComponent: Double, imaginaryComponent: Double) {
        self.realComponent = realComponent
        self.r = realComponent
        self.imaginaryComponent = imaginaryComponent
        self.i = imaginaryComponent
    }
    
    init(_ real: Double, _ imaginary: Double) {
        self.init(realComponent: real, imaginaryComponent: imaginary)
    }
    
    func getRealComponent() -> Double {
        return realComponent
    }
    
    func getImaginaryComponent() -> Double {
        return imaginaryComponent
    }
    
    func multiply(complexNumber: ComplexNumber) -> ComplexNumber {
        let iR = complexNumber.r
        let iI = complexNumber.i
        let real = r * iR - i * iI
        let imaginary = i * iR + r * iI
        return ComplexNumber(real, imaginary)
    }
    
    func divide(complexNumber: ComplexNumber) -> ComplexNumber {
        let iR = complexNumber.r
        let iI = complexNumber.i
        let real = (r * iR + i * iI) / (iR * iR + iI * iI)
        let imaginary = (i * iR - r * iI) / (iR * iR + iI * iI)
        return ComplexNumber(real, imaginary)
    }
    
    func add(complexNumber: ComplexNumber) -> ComplexNumber {
        let real = r + complexNumber.r
        let imaginary = i + complexNumber.i
        return ComplexNumber(real, imaginary)
    }
    
    func subtract(complexNumber: ComplexNumber) -> ComplexNumber {
        let real = r - complexNumber.r
        let imaginary = i - complexNumber.i
        return ComplexNumber(real, imaginary)
    }
    
    func absolute() -> Double {
        return sqrt(r * r + i * i)
    }
    
    func conjugate() -> ComplexNumber {
        return ComplexNumber(r, -i)
    }
    
    func exponent() -> ComplexNumber {
        return ComplexNumber(exp(r), 0)
            .multiply(complexNumber: ComplexNumber(cos(i), sin(i)))
    }
}
