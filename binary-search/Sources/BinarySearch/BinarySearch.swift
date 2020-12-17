//Solution goes in Sources
class BinarySearch<T: Comparable> {
    let list: [T]
    
    var middle: Int {
        return list.count / 2
    }
    
    init(_ list: [T]) throws {
        guard list.isSorted() else {
            throw BinarySearchError.unsorted
        }
        self.list = list
    }
    
    func searchFor(_ item: T) -> Int? {
        guard !list.isEmpty else { return nil }

        var lower = 0
        var higher = list.count
        var middle = list.count / 2

        while higher > lower {
            middle = lower + (higher - lower) / 2
            
            if item == list[middle] {
                return middle
            } else if item < list[middle] {
                higher = middle
            } else {
                lower = middle + 1
            }
        }
        return nil
    }
}

enum BinarySearchError: Error {
    case unsorted
}

extension Array where Element: Comparable {
    func isSorted() -> Bool {
        for i in self.indices.dropFirst() {
            if self[i] < self[i - 1] {
                return false
            }
        }
        return true
    }
}
