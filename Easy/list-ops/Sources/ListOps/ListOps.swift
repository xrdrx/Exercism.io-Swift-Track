//Solution goes in Sources
func append<T>(_ first: [T], _ second: [T]) -> [T] {
    return first + second
}

func concat<T>(_ items: [T]...) -> [T] {
    var result: [T] = []
    for item in items {
        result += item
    }
    return result
}

func filter<T>(_ items: [T], _ function: (T) -> Bool) -> [T] {
    var result: [T] = []
    for item in items {
        if function(item) {
            result += [item]
        }
    }
    return result
}

func length<T>(_ items: [T]) -> Int {
    var result = 0
    for _ in items {
        result += 1
    }
    return result
}

func map<T>(_ items: [T], _ function: (T) -> T) -> [T] {
    var result: [T] = []
    for item in items {
        result += [function(item)]
    }
    return result
}

func foldLeft(_ items: [Int], accumulated: Int, combine: (Int, Int) -> Int) -> Int {
    var result = accumulated
    for item in items {
        result = combine(result, item)
    }
    return result
}

func foldRight<T>(_ items: [T], accumulated: T, combine: (T, T) -> T) -> T {
    var result = accumulated
    for i in items.indices.reversed() {
        result = combine(items[i], result)
    }
    return result
}

func reverse<T>(_ items: [T]) -> [T] {
    var result: [T] = []
    for item in items {
        result = [item] + result
    }
    return result
}
