//Solution goes in Sources
struct Dominoes {
    private let dominoes: [(Int, Int)]
    
    var chained: Bool {
        return canBeChained(currentChain: [], dominoesToPick: dominoes)
    }
    
    init(_ input: [(Int, Int)]) {
        self.dominoes = input
    }
    
    private func canBeChained(currentChain: [(left: Int, right: Int)], dominoesToPick: [(left: Int, right: Int)]) -> Bool {
        if currentChain.isEmpty && dominoesToPick.isEmpty { return false }
        if currentChain.first?.left == currentChain.last?.right && dominoesToPick.isEmpty { return true }
        
        for domino in dominoesToPick {
            var current = currentChain
            if currentChain.last?.right == domino.left || currentChain.isEmpty {
                current.append(domino)
            } else if currentChain.last?.right == reverse(domino).left {
                current.append(reverse(domino))
            } else {
                continue
            }
            var toPick = dominoesToPick
            toPick.remove(at: toPick.firstIndex(where: { $0 == domino })!)
            if canBeChained(currentChain: current, dominoesToPick: toPick) { return true }
        }
        return false
    }

    private func reverse(_ domino: (left: Int, right: Int)) -> (left: Int, right: Int) {
        return (domino.right, domino.left)
    }
}
