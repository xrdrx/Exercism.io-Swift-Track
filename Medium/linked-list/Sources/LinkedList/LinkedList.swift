//Solution goes in Sources
class Deque<T> {
    private(set) var list: Node<T>?
    
    func push(_ value: T) {
        let new = Node(value)
        if let list = list {
            new.previous = list.last
            new.first = list.first
            
            list.last?.next = new
            list.last = new
        } else {
            list = new
        }
    }
    
    func unshift(_ value: T) {
        let new = Node(value)
        if let list = list {
            new.next = list.first
            new.last = list.last
            
            list.first?.previous = new
            list.first = new
        } else {
            list = new
        }
    }
    
    func pop() -> T? {
        let result = list?.last?.value
        list?.last = list?.last?.previous
        list?.last?.next = nil
        return result
    }
    
    func shift() -> T? {
        let result = list?.first?.value
        list?.first = list?.first?.next
        list?.first?.previous = nil
        return result
    }
}

class Node<T> {
    var value: T
    var first: Node?
    var last: Node?
    var previous: Node?
    var next: Node?
    
    init(_ value: T) {
        self.value = value
        self.first = self
        self.last = self
    }
}
