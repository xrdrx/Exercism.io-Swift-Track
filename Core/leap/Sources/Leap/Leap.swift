//Solution goes in Sources
class Year {
    private let year: Int
    
    var isLeapYear: Bool {
        return year.isMultiple(of: 4) && (!year.isMultiple(of: 100) || year.isMultiple(of: 400))
    }
    
    init(calendarYear: Int) {
        self.year = calendarYear
    }
}
