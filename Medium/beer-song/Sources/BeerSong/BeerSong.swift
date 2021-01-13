//Solution goes in Sources
struct BeerSong {
    private let numberOfBeerBottles: Int
    
    init(numberOfBeerBottles: Int) {
        self.numberOfBeerBottles = numberOfBeerBottles
    }
    
    func generateVersesOfBeerSong() -> String {
        return
            stride(from: numberOfBeerBottles, through: 0, by: -1)
            .map { verse(numberOfBottles: $0) }
            .joined(separator: "\n\n")
    }

    private func verse(numberOfBottles number: Int) -> String {
        return
            firstLineForVerse(withNumberOfBottles: number) +
            "\n" +
            secondLineForVerse(withNumberOfBottles: number)
    }
    
    private func firstLineForVerse(withNumberOfBottles number: Int) -> String {
        let count = getBottleCount(for: number)
        let first = count.first?.uppercased()
        return "\(first! + count.dropFirst(1)) of beer on the wall, \(count) of beer."
    }
    
    private func secondLineForVerse(withNumberOfBottles number: Int) -> String {
        if number == 0 {
            return "Go to the store and buy some more, 99 bottles of beer on the wall."
        }
        let count = getBottleCount(for: number - 1)
        return "Take one down and pass it around, \(count) of beer on the wall."
    }
    
    private func getBottleCount(for number: Int) -> String {
        switch number {
        case 0:
            return "no more bottles"
        case 1:
            return "1 bottle"
        case (let count):
            return "\(count) bottles"
        }
    }
}
