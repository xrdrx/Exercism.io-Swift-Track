//Solution goes in Sources
class Element<T> {
    var value: T?
    var next: Element?
    
    init(_ value: T? = nil, _ next: Element? = nil) {
        self.value = value
        self.next = next
    }
    
    static func fromArray(_ array: [T]) -> Element {
        let first = Element()
        var current = first
        for i in 0..<array.count {
            current.value = array[i]
            current.next = Element()
            current = current.next!
        }
        return first
    }
    
    func toArray() -> [T] {
        switch true {
        case value != nil && next != nil:
            return [value!] + next!.toArray()
        case value != nil:
            return [value!]
        case next != nil:
            return next!.toArray()
        default:
            return []
        }
    }
    
    func reverseElements() -> Self {
        guard let next = next else { return self }
        swap(&value, &next.value)
        return self
    }
}
