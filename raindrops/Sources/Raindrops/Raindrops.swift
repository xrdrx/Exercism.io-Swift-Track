//Solution goes in Sources
class Raindrops {
    private let number: Int
    
    var sounds: String {
        return getSounds()
    }
    
    private let factorsOutput = [
        3: "Pling",
        5: "Plang",
        7: "Plong"]
    
    init(_ number: Int) {
        self.number = number
    }
    
    private func getSounds() -> String {
        var result = ""
        
        for factor in factorsOutput.keys.sorted() {
            if number % factor == 0 {
                result += factorsOutput[factor]!
            }
        }
        
        if result.isEmpty { return String(number) }
        return result
    }
}
