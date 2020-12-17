//Solution goes in Sources
class GradeSchool {
    private var _roster: [Int: [String]] = [:]
    var roster: [Int: [String]] {
        return _roster
    }
    
    var sortedRoster: [Int: [String]] {
        return _roster.mapValues { $0.sorted() }
    }
    
    func addStudent(_ name: String, grade: Int) {
        _roster[grade, default: []].append(name)
    }
    
    func studentsInGrade(_ grade: Int) -> [String] {
        return roster[grade] ?? []
    }
}
