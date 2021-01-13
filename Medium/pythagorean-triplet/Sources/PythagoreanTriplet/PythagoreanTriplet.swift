//Solution goes in Sources
struct Triplet {
    var triplet: (a: Int, b: Int, c: Int)
    
    var sum: Int {
        triplet.a + triplet.b + triplet.c
    }
    
    var product: Int {
        triplet.a * triplet.b * triplet.c
    }
    
    var isPythagorean: Bool {
        triplet.a * triplet.a +
            triplet.b * triplet.b ==
            triplet.c * triplet.c
    }
    
    init(_ a: Int, _ b: Int, _ c: Int) {
        self.triplet = (a, b, c)
    }
    
    static func fromWhere(_ minFactor: Int = 1, maxFactor: Int, sum: Int? = nil) -> [Triplet] {
        let generatedK = (1...15).map { $0 }
        let generatedM = (1...15).map { $0 }
        let generatedN = (1...15).map { $0 }
        
        var result: [Triplet] = []
        for k in generatedK {
            for m in generatedM {
                for n in generatedN {
                    if m < n { continue }
                    
                    let a = generateA(k, m, n)
                    let b = generateB(k, m, n)
                    let c = generateC(k, m, n)
                    
                    if let sum = sum {
                        if [a, b, c].reduce(0, +) != sum { continue }
                    }
                    if [a, b, c].max()! > maxFactor { continue }
                    if [a, b, c].min()! < minFactor { continue }
                    
                    let triplet = Triplet(a, b, c)
                    if triplet.isPythagorean && !result.contains(where: { $0.product == triplet.product }) {
                        result.append(triplet)
                    }
                }
            }
        }
        return result
    }
        
    private static func generateA(_ k: Int, _ m: Int, _ n: Int) -> Int {
        return k * (m * m - n * n)
    }
    
    private static func generateB(_ k: Int, _ m: Int, _ n: Int) -> Int {
        return k * 2 * m * n
    }

    private static func generateC(_ k: Int, _ m: Int, _ n: Int) -> Int {
        return k * (m * m + n * n)
    }
}
