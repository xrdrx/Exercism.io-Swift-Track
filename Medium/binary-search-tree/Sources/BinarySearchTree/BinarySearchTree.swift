//Solution goes in Sources
class BinarySearchTree {
    private(set) var data: Int
    private(set) var left: BinarySearchTree?
    private(set) var right: BinarySearchTree?
    
    init(_ data: Int) {
        self.data = data
    }
    
    func insert(_ value: Int) {
        if value <= data {
            insert(value, to: &left)
        } else {
            insert(value, to: &right)
        }
    }
    
    private func insert(_ value: Int, to node: inout BinarySearchTree?) {
        if let node = node {
            node.insert(value)
        } else {
            node = BinarySearchTree(value)
        }
    }
    
    func allData() -> [Int] {
        return (left?.allData() ?? []) + [data] + (right?.allData() ?? [])
    }
}
