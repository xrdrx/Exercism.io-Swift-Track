//Solution goes in Sources
struct PokerHand {
    let hand: Hand
    
    init?(_ input: String, factory: HandFactory = HandFactory()) {
        guard let hand = factory.makeHand(input) else { return nil }
        self.hand = hand
    }
}

func bestHand(_ input: [String]) -> String {
    let factory = HandFactory()
    let hands = input.compactMap({ factory.makeHand($0) })
    let maxHand = hands.max(by: <)
    let index = hands.index(of: maxHand!)!
    return input[index]
}

enum Suit: String {
    case heart   = "♡"
    case diamond = "♢"
    case club    = "♧"
    case spade   = "♤"
}

struct Rank: Hashable {
    let value: Int
    
    init?(_ symbol: String) {
        switch symbol {
        case "2":  self.value = 2
        case "3":  self.value = 3
        case "4":  self.value = 4
        case "5":  self.value = 5
        case "6":  self.value = 6
        case "7":  self.value = 7
        case "8":  self.value = 8
        case "9":  self.value = 9
        case "10": self.value = 10
        case "J":  self.value = 11
        case "Q":  self.value = 12
        case "K":  self.value = 13
        case "A":  self.value = 14
        default: return nil
        }
    }
}

extension Rank: Comparable {
    static func < (lhs: Rank, rhs: Rank) -> Bool {
        lhs.value < rhs.value
    }
}

struct Card: Equatable, Hashable {
    let suit: Suit
    let rank: Rank
    
    init?(rank: String, suit: String) {
        guard let rank = Rank(rank), let suit = Suit(rawValue: suit) else {
            return nil
        }
        self.rank = rank
        self.suit = suit
    }
    
    init?(_ input: String) {
        guard input.count > 1 && input.count < 4 else { return nil }
        let suit = String(input.last!)
        let rank = String(input.dropLast())
        self.init(rank: rank, suit: suit)
    }
}

extension Card: Comparable {
    static func < (lhs: Card, rhs: Card) -> Bool {
        lhs.rank < rhs.rank
    }
}

struct Hand {
    let cards: [Card]
    let rank: HandRank
    
    init(cards: [Card], rank: HandRank) {
        self.cards = cards
        self.rank = rank
    }
}

extension Hand: Comparable {
    static func < (lhs: Hand, rhs: Hand) -> Bool {
        if lhs.rank != rhs.rank {
            return lhs.rank < rhs.rank
        }
        return highCard(lhs, lessThan: rhs)
    }

    static private func highCard(_ lhs: Hand, lessThan rhs: Hand) -> Bool {
        for i in stride(from: 4, through: 0, by: -1) {
            if lhs.cards[i].rank != rhs.cards[i].rank {
                return lhs.cards[i].rank < rhs.cards[i].rank
            }
        }
        return false
    }
    
    static func == (lhs: Hand, rhs: Hand) -> Bool {
        zip(lhs.cards, rhs.cards).allSatisfy({ $0.0.rank == $0.1.rank })
    }
}

struct HandFactory {
    func makeHand(_ input: String) -> Hand? {
        let cards = input
            .split(separator: " ")
            .compactMap({ Card(String($0)) })
            .sortedByCountAndRank()
        guard cards.count == 5 else { return nil }
        let rank = getHandRank(cards)
        return Hand(cards: cards, rank: rank)
    }
    
    func getHandRank(_ input: [Card]) -> HandRank {
        let sorted = input.sortedByCountAndRank()
        switch true {
        case isStraightFlush(sorted): return .straightFlush
        case isFourOfAKind(sorted):   return .fourOfAKind
        case isFullHouse(sorted):     return .fullHouse
        case isFlush(sorted):         return .flush
        case isStraight(sorted):      return .straight
        case isThreeOfAKind(sorted):  return .threeOfAKind
        case isTwoPair(sorted):       return .twoPair
        case isOnePair(sorted):       return .onePair
        default:                      return .highCard
        }
    }
    
    private func isStraightFlush(_ input: [Card]) -> Bool {
        return input.haveEqualSuit() && input.isStraight()
    }
    
    private func isFourOfAKind(_ input: [Card]) -> Bool {
        return input[1...4].haveEqualRank()
    }
    
    private func isFullHouse(_ input: [Card]) -> Bool {
        return input[0...1].haveEqualRank() && input[2...4].haveEqualRank()
    }
    
    private func isFlush(_ input: [Card]) -> Bool {
        return input.haveEqualSuit()
    }
    
    private func isStraight(_ input: [Card]) -> Bool {
        return input.isStraight()
    }
    
    private func isThreeOfAKind(_ input: [Card]) -> Bool {
        return input[2...4].haveEqualRank()
    }
    
    private func isTwoPair(_ input: [Card]) -> Bool {
        return input[1...2].haveEqualRank() && input[3...4].haveEqualRank()
    }
    
    private func isOnePair(_ input: [Card]) -> Bool {
        return input[3...4].haveEqualRank()
    }
}

enum HandRank: Comparable {
    case highCard
    case onePair
    case twoPair
    case threeOfAKind
    case straight
    case flush
    case fullHouse
    case fourOfAKind
    case straightFlush
}

extension Collection where Element == Card {
    func haveEqualRank() -> Bool {
        self.allSatisfy({ $0.rank == self.first?.rank })
    }
    
    func haveEqualSuit() -> Bool {
        self.allSatisfy({ $0.suit == self.first?.suit })
    }
    
    func isStraight() -> Bool {
        let sortedValues = self.map({ $0.rank.value }).sorted()
        var variants: [[Int]] = [sortedValues]
        if sortedValues.contains(14) { // check Ace as one
            var secondVariant = sortedValues.dropLast()
            secondVariant.insert(1, at: 0)
            variants.append(Array(secondVariant))
        }
        return variants.reduce(false) { $0 || $1.isConsecutive() }
    }
    
    func sortedByCountAndRank() -> [Card] {
        return
            self.reduce(into: [:], { $0[$1.rank, default: []].append($1) })
            .values
            .sorted(by: {
                lhs, rhs in
                if lhs.count != rhs.count {
                    return lhs.count < rhs.count
                }
                return lhs[0].rank < rhs[0].rank
            })
            .flatMap({ $0 })
    }
}

extension Collection where Element == Int {
    func isConsecutive() -> Bool {
        guard !self.isEmpty else { return false }
        return self.max()! - self.min()! + 1 == self.count
    }
}
