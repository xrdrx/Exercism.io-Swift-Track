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
        if _roster[grade] != nil {
            _roster[grade]?.append(name)
        } else {
            _roster[grade] = [name]
        }
    }
    
    func studentsInGrade(_ grade: Int) -> [String] {
        return roster[grade] ?? []
    }
}
