//Solution goes in Sources
import Foundation

struct Robot {
    private let storage: UniqueNamesStorage
    private let alphabet: [String]
    
    private(set) var name: String
    
    init(nameStorage: UniqueNamesStorage = UniqueNamesStorage.shared) {
        self.storage = nameStorage
        self.alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map { $0.description }
        self.name = ""
        resetName()
    }
    
    mutating func resetName() {
        let old = name
        
        repeat {
            name = ""
            name.append(alphabet.randomElement()!)
            name.append(alphabet.randomElement()!)
            name.append(String(format: "%03d", Int.random(in: 0...999)))
        } while storage.contains(name: name)
        
        storage.add(name: name)
        storage.remove(name: old)
    }
}

class UniqueNamesStorage {
    private var storage: Set<String>
    
    static var shared: UniqueNamesStorage = {
        let instance = UniqueNamesStorage()
        return instance
    }()
    
    private init() {
        self.storage = []
    }
    
    func contains(name: String) -> Bool {
        return storage.contains(name)
    }
    
    func remove(name: String) {
        storage.remove(name)
    }
    
    func add(name: String) {
        storage.insert(name)
    }
}
