//Solution goes in Sources
import Foundation

class Garden {
    private let plants: String
    private let children: [String]
    
    private lazy var sortedPlants: [Int: [String]] = {
        sortPlantsByNumber()
    }()
    private lazy var enumeratedChildren: [String: Int] = {
        enumerateChildren()
    }()
    
    init(_ plants: String, children: [String] = Children.all) {
        self.plants = plants
        self.children = children
    }
    
    func plantsForChild(_ name: String) -> [Plants] {
        guard let number = enumeratedChildren[name] else { return [] }
        guard let plants = sortedPlants[number] else { return [] }
        
        return plants.map { Plants($0) }
    }
    
    private func sortPlantsByNumber() -> [Int: [String]] {
        var dict: [Int: [String]] = [:]
        
        plants.components(separatedBy: "\n").forEach { plants in
            for (index, plant) in plants.enumerated() {
                dict[index / 2, default: []].append(String(plant))
            }
        }
        
        return dict
    }
    
    private func enumerateChildren() -> [String: Int] {
        var dict: [String: Int] = [:]
        for (index, child) in children.sorted().enumerated() {
            dict[child] = index
        }
        return dict
    }
}

enum Children {
    static let all = [
        "Alice",
        "Bob",
        "Charlie",
        "David",
        "Eve",
        "Fred",
        "Ginny",
        "Harriet",
        "Ileana",
        "Joseph",
        "Kincaid",
        "Larry"
    ]
}

enum Plants {
    init(_ symbol: String) {
        switch symbol {
        case "C":
            self = .clover
        case "G":
            self = .grass
        case "R":
            self = .radishes
        case "V":
            self = .violets
        default:
            fatalError("Wrong symbol for a plant!")
        }
    }
    
    case clover
    case grass
    case radishes
    case violets
}
