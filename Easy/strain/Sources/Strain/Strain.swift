//Solution goes in Sources
extension Collection {
    func keep(_ function: (Element) -> Bool) -> [Element] {
        var result: [Element] = []
        for value in self where function(value) {
            result.append(value)
        }
        return result
    }
    
    func discard(_ function: (Element) -> Bool) -> [Element] {
        return keep { !function($0) }
    }
}
