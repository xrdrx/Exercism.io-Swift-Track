import XCTest
@testable import BinarySearch

class BinarySearchTests: XCTestCase {

    func testHasListData() {
        let binary = try! BinarySearch([1, 3, 4, 6, 8, 9, 11])
        XCTAssertEqual([1, 3, 4, 6, 8, 9, 11], binary.list)
    }

    func testThrowsErrorForUnsortedList() {
        XCTAssertThrowsError(_ = try BinarySearch([2, 1, 4, 3, 6])) { error in
            XCTAssertEqual(error as? BinarySearchError, BinarySearchError.unsorted)
        }
    }
    
    func testOneElementArray() {
        let binary = try! BinarySearch([5])
        XCTAssertEqual(0, binary.searchFor(5))
        XCTAssertEqual(nil, binary.searchFor(10))
    }

    func testNilForDataNotInList() {
        XCTAssertNil(try! BinarySearch([1, 3, 6]).searchFor(2))
    }

    func testFindsPositionOfMiddleItem() {
        let binary = try! BinarySearch([1, 3, 4, 6, 8, 9, 11])
        XCTAssertEqual(3, binary.middle)
    }

    func testFindsPositionOfSearchData() {
        let binary = try! BinarySearch([1, 3, 4, 6, 8, 9, 11])
        XCTAssertEqual(5, binary.searchFor(9))
    }

    func testFindsPositionInALargerList() {
        let binary = try! BinarySearch([1, 3, 5, 8, 13, 21, 34, 55, 89, 144])
        XCTAssertEqual(0, binary.searchFor(1))
        XCTAssertEqual(1, binary.searchFor(3))
        XCTAssertEqual(2, binary.searchFor(5))
        XCTAssertEqual(3, binary.searchFor(8))
        XCTAssertEqual(4, binary.searchFor(13))
        XCTAssertEqual(5, binary.searchFor(21))
        XCTAssertEqual(6, binary.searchFor(34))
        XCTAssertEqual(7, binary.searchFor(55))
        XCTAssertEqual(8, binary.searchFor(89))
        XCTAssertEqual(9, binary.searchFor(144))
        XCTAssertEqual(nil, binary.searchFor(500))
    }

    func testFindsCorrectPositionInAListWithAnEvenNumberOfElements() {
        let binary = try! BinarySearch([1, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377])
        XCTAssertEqual(5, binary.searchFor(21))
        XCTAssertEqual(11, binary.searchFor(377))
        XCTAssertEqual(6, binary.searchFor(34))
        XCTAssertEqual(nil, binary.searchFor(500))
    }

    static var allTests: [(String, (BinarySearchTests) -> () throws -> Void)] {
        return [
            ("testHasListData", testHasListData),
            ("testThrowsErrorForUnsortedList", testThrowsErrorForUnsortedList),
            ("testNilForDataNotInList", testNilForDataNotInList),
            ("testFindsPositionOfMiddleItem", testFindsPositionOfMiddleItem),
            ("testFindsPositionOfSearchData", testFindsPositionOfSearchData),
            ("testFindsPositionInALargerList", testFindsPositionInALargerList),
            ("testFindsCorrectPositionInAListWithAnEvenNumberOfElements", testFindsCorrectPositionInAListWithAnEvenNumberOfElements),
        ]
    }
}
