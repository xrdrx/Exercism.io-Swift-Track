//Solution goes in Sources
class Year {
    private let year: Int
    
    var isLeapYear: Bool {
        return yearIsLeapYear()
    }
    
    init(calendarYear: Int) {
        self.year = calendarYear
    }
    
    private func yearIsLeapYear() -> Bool {
        return year.isMultiple(of: 4) && (!year.isMultiple(of: 100) || year.isMultiple(of: 400))
    }
}
