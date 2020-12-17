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
        
        var items = list
        var result = middle
        var index = middle
        
        while !items.isEmpty {
            if items[index] == item { return result }
            
            if items[index] > item {
                items = Array(items.prefix(index))
                index = items.count / 2
                result -= (items.count - index)
                continue
            }
            
            if items[index] < item {
                items = Array(items.suffix(items.count - index - 1))
                index = items.count / 2
                result += index + 1
                continue
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
