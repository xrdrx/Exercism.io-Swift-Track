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
        return yearIsDivisibleBy(4) && (!yearIsDivisibleBy(100) || yearIsDivisibleBy(400))
    }
    
    private func yearIsDivisibleBy(_ number: Int) -> Bool {
        return year % number == 0
    }
}

