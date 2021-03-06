//Solution goes in Sources
func classifier(listOne: [Int], listTwo: [Int]) -> ListRelation {
    if listOne == listTwo { return .equal }
    if listOne.count < listTwo.count &&
        check(listOne, isSublistOf: listTwo) {
        return .sublist
    }
    if listOne.count > listTwo.count &&
        check(listTwo, isSublistOf: listOne) {
        return .superlist
    }
    return .unequal
}

func check(_ listOne: [Int], isSublistOf listTwo: [Int]) -> Bool {
    if listOne.isEmpty { return true }
    if listOne.count == 1 { return listTwo.contains(listOne[0]) }
    
    var valuesIndecies: [Int: [Int]] = [:]
    for i in 0..<listTwo.count {
        valuesIndecies[listTwo[i], default: []].append(i)
    }
    
    guard var current = valuesIndecies[listOne[0]] else { return false }
    var temp: [Int] = []
    
    for i in 1..<listOne.count {
        guard let next = valuesIndecies[listOne[i]] else { return false }
        
        temp = current.reduce(into: []) {
            if next.contains($1 + 1) { $0.append($1 + 1) }
        }

        if temp.isEmpty { return false }
        current = temp
        temp = []
    }
    
    return true
}

enum ListRelation {
    case equal
    case unequal
    case sublist
    case superlist
}
