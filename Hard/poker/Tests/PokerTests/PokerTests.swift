import XCTest
@testable import Poker

class PokerTests: XCTestCase {
    var validTestCases:[(name: String, hands: [String], best: String)] = []
    var invalidTestCases:[(name: String, hand: String)] = []
    
    func testHeartInstance() {
        let heart = Suit(rawValue: "♡")
        XCTAssertTrue(heart == .heart)
    }
    
    func testClubInstance() {
        let club = Suit(rawValue: "♧")
        XCTAssertTrue(club == .club)
    }
    
    func testSpadeInstance() {
        let spade = Suit(rawValue: "♤")
        XCTAssertTrue(spade == .spade)
    }
    
    func testDiamondInstance() {
        let diamond = Suit(rawValue: "♢")
        XCTAssertTrue(diamond == .diamond)
    }
    
    func testInvalidSuit() {
        let invalid = Suit(rawValue: "Y")
        XCTAssertNil(invalid)
    }
    
    func testJackRank() {
        let jack = Rank("J")
        XCTAssertEqual(jack?.value, 11)
    }
    
    func testQueenRank() {
        let queen = Rank("Q")
        XCTAssertEqual(queen?.value, 12)
    }
    
    func testKingRank() {
        let king = Rank("K")
        XCTAssertEqual(king?.value, 13)
    }
    
    func testAceRank() {
        let ace = Rank("A")
        XCTAssertEqual(ace?.value, 14)
    }
    
    func test9Rank() {
        let nine = Rank("9")
        XCTAssertEqual(nine?.value, 9)
    }
    
    func testInvalidRank1() {
        let invalid = Rank("15")
        XCTAssertNil(invalid)
    }

    func testInvalidRank2() {
        let invalid = Rank("B")
        XCTAssertNil(invalid)
    }
    
    func testInvalidRank3() {
        let invalid = Rank("1")
        XCTAssertNil(invalid)
    }
    
    func testRankComparison1() {
        let lower = Rank("5")!
        let higher = Rank("A")!
        XCTAssertTrue(higher > lower)
    }
    
    func testRankComparison2() {
        let equal1 = Rank("5")!
        let equal2 = Rank("5")!
        XCTAssertTrue(equal1 == equal2)
    }
    
    func testCardInit1() {
        let card = Card("10♤")
        XCTAssertEqual(card?.rank.value, 10)
        XCTAssertEqual(card?.suit, .spade)
    }
    
    func testCardInit2() {
        let card = Card("11♤")
        XCTAssertNil(card)
    }
    
    func testCardInit3() {
        let card = Card("A♤")
        XCTAssertEqual(card?.rank.value, 14)
        XCTAssertEqual(card?.suit, .spade)
    }
    
    func testCardInit4() {
        let card = Card("J♢")
        XCTAssertEqual(card?.rank.value, 11)
        XCTAssertEqual(card?.suit, .diamond)
    }
    
    func testHandRank1() {
        let rank1 = HandRank.flush
        let rank2 = HandRank.highCard
        XCTAssertTrue(rank1 > rank2)
    }
    
    func testHandFactory1() {
        let factory = HandFactory()
        let hand = factory.makeHand("3♡ 10♢ 7♧ 8♤ A♢")
        XCTAssertNotNil(hand)
        XCTAssertEqual(hand?.rank, .highCard)
    }
    
    func testHandFactory2() {
        let factory = HandFactory()
        let hand = factory.makeHand("3♡ 10♢ 7♧ 8♤")
        XCTAssertNil(hand)
    }
    
    func testHandRank2() {
        let factory = HandFactory()
        let hand = "3♡ 10♢ 7♧ 8♤ A♢"
        let cards = hand.split(separator: " ").map({ Card(String($0))! })
        let rank = factory.getHandRank(cards)
        XCTAssertEqual(rank, .highCard)
    }
    
    func testHandRank3() {
        let factory = HandFactory()
        let hand = "3♢ 2♢ 5♤ 6♤ 9♡"
        let cards = hand.split(separator: " ").map({ Card(String($0))! })
        let rank = factory.getHandRank(cards)
        XCTAssertEqual(rank, .highCard)
    }
    
    func testHandRank4() {
        let factory = HandFactory()
        let hand = "3♡ 2♡ 5♧ 6♢ 10♡"
        let cards = hand.split(separator: " ").map({ Card(String($0))! })
        let rank = factory.getHandRank(cards)
        XCTAssertEqual(rank, .highCard)
    }
    
    func testStraightFlush1() {
        let factory = HandFactory()
        let hand = "3♡ 5♡ 4♡ 7♡ 6♡"
        let cards = hand.split(separator: " ").map({ Card(String($0))! })
        let rank = factory.getHandRank(cards)
        XCTAssertEqual(rank, .straightFlush)
    }
    
    func testStraightFlush2() {
        let factory = HandFactory()
        let hand = "2♤ 3♤ A♤ 5♤ 4♤"
        let cards = hand.split(separator: " ").map({ Card(String($0))! })
        let rank = factory.getHandRank(cards)
        XCTAssertEqual(rank, .straightFlush)
    }
    
    func testFourOfAKind1() {
        let factory = HandFactory()
        let hand = "3♢ 3♡ A♧ 3♤ 3♧"
        let cards = hand.split(separator: " ").map({ Card(String($0))! })
        let rank = factory.getHandRank(cards)
        XCTAssertEqual(rank, .fourOfAKind)
    }
    
    func testFullHouse1() {
        let factory = HandFactory()
        let hand = "2♢ 8♡ 8♢ 2♡ 8♧"
        let cards = hand.split(separator: " ").map({ Card(String($0))! })
        let rank = factory.getHandRank(cards)
        XCTAssertEqual(rank, .fullHouse)
    }
    
    func testFlush1() {
        let factory = HandFactory()
        let hand = "4♤ 3♤ 8♤ J♤ K♤"
        let cards = hand.split(separator: " ").map({ Card(String($0))! })
        let rank = factory.getHandRank(cards)
        XCTAssertEqual(rank, .flush)
    }
    
    func testStraight1() {
        let factory = HandFactory()
        let hand = "Q♡ K♡ J♢ 10♧ 9♡"
        let cards = hand.split(separator: " ").map({ Card(String($0))! })
        let rank = factory.getHandRank(cards)
        XCTAssertEqual(rank, .straight)
    }
    
    func testThreeOfAKind1() {
        let factory = HandFactory()
        let hand = "4♢ 3♤ 4♤ J♤ 4♡"
        let cards = hand.split(separator: " ").map({ Card(String($0))! })
        let rank = factory.getHandRank(cards)
        XCTAssertEqual(rank, .threeOfAKind)
    }
    
    func testTwoPair1() {
        let factory = HandFactory()
        let hand = "2♢ 8♡ 5♢ 2♡ 8♧"
        let cards = hand.split(separator: " ").map({ Card(String($0))! })
        let rank = factory.getHandRank(cards)
        XCTAssertEqual(rank, .twoPair)
    }
    
    func testOnePair1() {
        let factory = HandFactory()
        let hand = "4♢ 3♤ 4♤ J♤ K♤"
        let cards = hand.split(separator: " ").map({ Card(String($0))! })
        let rank = factory.getHandRank(cards)
        XCTAssertEqual(rank, .onePair)
    }
    func testInvalidCases() {
        for each in invalidTestCases {
            XCTAssertNil(PokerHand(each.hand), "\(each.name)")
        }
    }

    func testAllValid() {
        for each in validTestCases {
            XCTAssertEqual(Poker.bestHand(each.hands), each.best, "\(each.name)")
        }
    }

    override func setUp() {
        super.setUp()

        validTestCases = [
            (
                name:  "single hand is always best",
                hands: ["3♡ 10♢ 7♧ 8♤ A♢"],
                best:  "3♡ 10♢ 7♧ 8♤ A♢"
            ),
            (
                name:  "highest card",
                hands: ["3♢ 2♢ 5♤ 6♤ 9♡", "3♡ 2♡ 5♧ 6♢ 10♡"],
                best:  "3♡ 2♡ 5♧ 6♢ 10♡"
            ),
            (
                name:  "One pair",
                hands: ["3♢ 2♢ 5♤ 6♤ 9♡", "3♡ 3♤ 5♧ 6♢ 9♢"],
                best:  "3♡ 3♤ 5♧ 6♢ 9♢"
            ),
            (
                name:  "pair beats lower",
                hands: ["4♢ 3♤ 4♤ J♤ K♤", "A♡ K♡ J♢ 10♧ 9♡"],
                best:  "4♢ 3♤ 4♤ J♤ K♤"
            ),
            (
                name:  "best pair",
                hands: ["4♡ 2♡ 5♧ 4♢ 10♡", "3♢ 3♡ 5♤ 6♤ 9♡"],
                best:  "4♡ 2♡ 5♧ 4♢ 10♡"
            ),
            (
                name:  "best pair with same pair and highest cards",
                hands: ["4♡ 2♡ 5♧ 4♢ 10♡", "4♤ 4♧ 5♡ 10♢ 3♡"],
                best:  "4♤ 4♧ 5♡ 10♢ 3♡"
            ),
            (
                name: "two pair beats lower",
                hands: [
                    "4♢ 3♤ 4♤ J♤ K♤",
                    "A♡ K♡ J♢ 10♧ 9♡",
                    "2♢ 8♡ 5♢ 2♡ 8♧"
                ],
                best:  "2♢ 8♡ 5♢ 2♡ 8♧"
            ),
            (
                name: "best two pair",
                hands: [
                    "4♢ J♧ 4♤ J♤ K♤",
                    "A♡ K♡ J♢ 10♧ 9♡",
                    "2♢ 8♡ 5♢ 2♡ 8♧"
                ],
                best:  "4♢ J♧ 4♤ J♤ K♤"
            ),
            (
                name: "best two pair with equal highest pair",
                hands: [
                    "4♢ J♧ 4♤ J♤ K♤",
                    "A♡ K♡ J♢ 10♧ 9♡",
                    "3♢ J♡ 5♢ 3♡ J♢"
                ],
                best:  "4♢ J♧ 4♤ J♤ K♤"
            ),
            (
                name: "best two pair with equal pairs",
                hands: [
                    "4♢ J♧ 4♤ J♤ 2♤",
                    "A♡ K♡ J♢ 10♧ 9♡",
                    "4♧ J♡ 5♢ 4♡ J♢"
                ],
                best:  "4♧ J♡ 5♢ 4♡ J♢"
            ),
            (
                name: "full house",
                hands: [
                    "4♢ 3♤ 4♤ J♤ K♤",
                    "A♡ K♡ J♢ 10♧ 9♡",
                    "3♡ 8♡ 3♢ 3♧ 8♧",
                    "2♢ 8♡ 5♢ 2♡ 8♧"
                ],
                best:  "3♡ 8♡ 3♢ 3♧ 8♧"
            ),
            (
                name: "best three of a kind",
                hands: [
                    "4♢ 3♤ 4♤ J♤ 4♡",
                    "A♡ K♡ J♢ 10♧ 9♡",
                    "3♢ 8♡ 3♡ 3♧ 9♧",
                    "2♢ 8♡ 5♢ 2♡ 8♧"
                ],
                best:  "4♢ 3♤ 4♤ J♤ 4♡"
            ),
            (
                name: "straight beats lower",
                hands: [
                    "4♢ 3♤ 4♤ J♤ K♤",
                    "Q♡ K♡ J♢ 10♧ 9♡",
                    "3♡ 8♡ 3♢ 3♧ 9♧",
                    "2♢ 8♡ 5♢ 2♡ 8♧"
                ],
                best:  "Q♡ K♡ J♢ 10♧ 9♡"
            ),
            (
                name: "straight includes ace as one",
                hands: [
                    "4♢ 3♤ 4♤ J♤ K♤",
                    "2♤ 3♡ A♤ 5♤ 4♤",
                    "3♢ 8♡ 3♡ 3♧ 9♧",
                    "2♢ 8♡ 5♢ 2♡ 8♧"
                ],
                best:  "2♤ 3♡ A♤ 5♤ 4♤"
            ),
            (
                name: "best straight",
                hands: [
                    "4♢ 3♤ 4♤ J♤ K♤",
                    "Q♡ K♡ J♢ 10♧ 9♡",
                    "A♢ K♧ 10♢ J♢ Q♢",
                    "2♢ 8♡ 5♢ 2♡ 8♧"
                ],
                best:  "A♢ K♧ 10♢ J♢ Q♢"
            ),
            (
                name: "flush beats lower",
                hands: [
                    "4♤ 3♤ 8♤ J♤ K♤",
                    "Q♡ K♡ J♢ 10♧ 9♡",
                    "3♢ 8♡ 3♢ 3♧ 9♧",
                    "2♢ 8♡ 5♢ 2♡ 8♧"
                ],
                best:  "4♤ 3♤ 8♤ J♤ K♤"
            ),
            (
                name: "best flush",
                hands: [
                    "4♤ 3♤ 8♤ J♤ K♤",
                    "Q♡ K♡ J♢ 10♧ 9♡",
                    "3♢ 8♢ A♢ 2♢ 7♢",
                    "2♢ 8♡ 5♢ 2♡ 8♧"
                ],
                best:  "3♢ 8♢ A♢ 2♢ 7♢"
            ),
            (
                name: "full house beats lower",
                hands: [
                    "4♤ 3♤ 8♤ J♤ K♤",
                    "2♢ 8♡ 8♢ 2♡ 8♧",
                    "Q♡ K♡ J♢ 10♧ 9♡",
                    "3♡ A♡ 3♢ 3♧ A♧"
                ],
                best:  "2♢ 8♡ 8♢ 2♡ 8♧"
            ),
            (
                name: "best full house",
                hands: [
                    "4♤ 3♤ 8♤ J♤ K♤",
                    "2♢ 8♡ 8♢ 2♡ 8♧",
                    "5♡ 5♢ A♤ 5♧ A♢",
                    "3♡ A♡ 3♢ 3♧ A♧"
                ],
                best:  "2♢ 8♡ 8♢ 2♡ 8♧"
            ),
            (
                name: "four of a kind beats lower",
                hands: [
                    "4♤ 5♤ 8♤ J♤ K♤",
                    "2♢ 8♡ 8♢ 2♡ 8♧",
                    "Q♡ K♡ J♢ 10♧ 9♡",
                    "3♢ 3♡ 3♤ 3♧ A♧"
                ],
                best:  "3♢ 3♡ 3♤ 3♧ A♧"
            ),
            (
                name: "best four of a kind",
                hands: [
                    "4♤ 5♤ 8♤ J♤ K♤",
                    "2♢ 2♧ 8♢ 2♡ 2♤",
                    "Q♡ K♡ J♢ 10♧ 9♡",
                    "3♢ 3♡ 3♤ 3♧ A♧"
                ],
                best:  "3♢ 3♡ 3♤ 3♧ A♧"
            ),
            (
                name: "straight flush beats lower",
                hands: [
                    "4♤ 4♢ 4♡ 4♧ K♤",
                    "2♢ 8♡ 8♢ 2♡ 8♧",
                    "Q♡ K♡ 8♡ 10♡ 9♡",
                    "2♤ 3♤ A♤ 5♤ 4♤"
                ],
                best:  "2♤ 3♤ A♤ 5♤ 4♤"
            ),
            (
                name: "best straight flush is royal flush",
                hands: [
                    "4♤ 5♤ 8♤ J♤ K♤",
                    "2♢ 8♡ 8♢ 2♡ 8♧",
                    "Q♡ K♡ J♡ 10♡ 9♡",
                    "Q♢ K♢ J♢ 10♢ A♢"
                ],
                best:  "Q♢ K♢ J♢ 10♢ A♢"
            )
        ]

        invalidTestCases  =
            [
                (
                    name: "1 is an invalid card rank",
                    hand: "1♢ 2♡ 3♡ 4♡ 5♡"
                ),
                (
                    name: "15 is an invalid card rank",
                    hand: "15♢ 2♡ 3♡ 4♡ 5♡"
                ),
                (
                    name: "too few cards",
                    hand: "2♡ 3♡ 4♡ 5♡"
                ),
                (
                    name: "too many cards",
                    hand: "2♡ 3♡ 4♡ 5♡ 6♡ 7♡"
                ),
                (
                    name: "lack of rank",
                    hand: "11♢ 2♡ ♡ 4♡ 5♡"
                ),
                (
                    name: "lack of suit",
                    hand: "2♡ 3♡ 4 5♡ 7♡"
                ),
                (
                    name: "H is an invalid suit",
                    hand: "2♡ 3♡ 4H 5♡ 7♡"
                ),
                (
                    name: "♥ is an invalid suit",
                    hand: "2♡ 3♡ 4♥ 5♡ 7♡"
                ),
                (
                    name: "lack of spacing",
                    hand: "2♡ 3♡ 5♡7♡ 8♡"
                ),
                (
                    name: "double suits after rank",
                    hand: "2♡ 3♡ 5♡♡ 8♡ 9♡"
                )
        ]

    }

    static var allTests: [(String, (PokerTests) -> () throws -> Void)] {
        return [
            ("testInvalidCases", testInvalidCases),
            ("testAllValid", testAllValid),
        ]
    }
}
