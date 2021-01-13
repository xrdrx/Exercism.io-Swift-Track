//Solution goes in Sources
func verse(_ number: Int) -> String {
    let animal = makeAnimal(number)
    return animal.constructVerse()
}

func song() -> String {
    return (1...8).map({ verse($0) }).joined(separator: "\n\n")
}

func makeAnimal(_ number: Int) -> Animal {
    switch number {
    case 1: return Fly(prev: nil)
    case 2: return Spider()
    case 3: return Bird()
    case 4: return Cat()
    case 5: return Dog()
    case 6: return Goat()
    case 7: return Cow()
    case 8: return Horse(prev: nil)
    default: fatalError("Invalid animal number")
    }
}

protocol Animal {
    var name: String { get }
    var prev: Animal? { get }

    func getIntro() -> String
    func getLastLine() -> String
    func getSecondLine() -> String
    func getMiddleLine() -> [String]
    func constructVerse() -> String
}

extension Animal {
    func getIntro() -> String {
        return "I know an old lady who swallowed a \(name)."
    }
    
    func getSecondLine() -> String {
        return ""
    }
    
    func getMiddleLine() -> [String] {
        guard let prev = prev else { return [""] }
        return ["She swallowed the \(name) to catch the \(prev.name)."] + prev.getMiddleLine()
    }
    
    func getLastLine() -> String {
        return "I don't know why she swallowed the fly. Perhaps she'll die."
    }
    
    func constructVerse() -> String {
        var output = [getIntro()]
        output.append(getSecondLine())
        output.append(contentsOf: getMiddleLine())
        output.append(getLastLine())
        return output.filter({ !$0.isEmpty }).joined(separator: "\n")
    }
}

struct Fly: Animal {
    let name = "fly"
    let prev: Animal?
    
    func constructVerse() -> String {
        [getIntro(), getLastLine()].joined(separator: "\n")
    }
}

struct Spider: Animal {
    let name = "spider"
    let prev: Animal? = Fly(prev: nil)
    
    func getSecondLine() -> String {
        "It wriggled and jiggled and tickled inside her."
    }
}

struct Bird: Animal {
    let name = "bird"
    let prev: Animal? = Spider()
    
    func getSecondLine() -> String {
        "How absurd to swallow a bird!"
    }
    
    func getMiddleLine() -> [String] {
        guard let prev = prev else { return [""] }
        return ["She swallowed the \(name) to catch the \(prev.name) that wriggled and jiggled and tickled inside her."] +
            prev.getMiddleLine()
    }
}

struct Cat: Animal {
    let name = "cat"
    let prev: Animal? = Bird()
    
    func getSecondLine() -> String {
        "Imagine that, to swallow a cat!"
    }
}

struct Dog: Animal {
    let name = "dog"
    let prev: Animal? = Cat()
    
    func getSecondLine() -> String {
        "What a hog, to swallow a dog!"
    }
}

struct Goat: Animal {
    let name = "goat"
    let prev: Animal? = Dog()
    
    func getSecondLine() -> String {
        "Just opened her throat and swallowed a goat!"
    }
}

struct Cow: Animal {
    let name = "cow"
    let prev: Animal? = Goat()
    
    func getSecondLine() -> String {
        "I don't know how she swallowed a cow!"
    }
}

struct Horse: Animal {
    let name = "horse"
    let prev: Animal?
    
    func getLastLine() -> String {
        "She's dead, of course!"
    }
}
