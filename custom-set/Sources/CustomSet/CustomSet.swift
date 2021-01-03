//Solution goes in Sources
struct CustomSet<T: Equatable & Hashable & Comparable>: Equatable {
    private var elements: Set<T>
    
    var size: Int {
        return elements.count
    }
    var toSortedArray: [T] {
        return Array(elements).sorted()
    }
    
    init(_ elements: [T]) {
        self.elements = Set(elements)
    }
    
    mutating func delete(_ value: T) {
        elements.remove(value)
    }
    
    mutating func put(_ value: T) {
        elements.insert(value)
    }
    
    func containsMember(_ value: T) -> Bool {
        return elements.contains(value)
    }
    
    mutating func removeAll() {
        elements.removeAll()
    }
    
    func isSupersetOf(_ customSet: CustomSet) -> Bool {
        return elements.isSuperset(of: customSet.elements)
    }
    
    func difference(_ customSet: CustomSet) -> CustomSet {
        var set = CustomSet([])
        set.elements = elements.subtracting(customSet.elements)
        return set
    }
    
    func union(_ customSet: CustomSet) -> CustomSet {
        var set = CustomSet([])
        set.elements = elements.union(customSet.elements)
        return set
    }
    
    func intersection(_ customSet: CustomSet) -> CustomSet {
        var set = CustomSet([])
        set.elements = elements.intersection(customSet.elements)
        return set
    }
    
    func isDisjoint(_ customSet: CustomSet) -> Bool {
        return elements.isDisjoint(with: customSet.elements)
    }
    
    static func == (lhs: CustomSet<T>, rhs: CustomSet<T>) -> Bool {
        return lhs.elements == rhs.elements
    }
}
