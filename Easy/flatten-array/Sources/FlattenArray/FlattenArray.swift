//Solution goes in Sources
func flattenArray<T>(_ items: [Any?]) -> [T] {
    var result: [Any] = []
    
    for item in items {
        guard item != nil else { continue }
        
        if item is Array<Any?> {
            result.append(contentsOf: flattenArray(item as! Array<Any>))
        } else {
            result.append(item!)
        }
    }
    
    return result as! [T]
}
