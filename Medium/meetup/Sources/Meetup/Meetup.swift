//Solution goes in Sources
import Foundation

struct Meetup {
    private let year: Int
    private let month: Int
    private var calendar: Calendar
    
    init(year: Int, month: Int, formatter: DateFormatter = MeetupDateFormatter(), calendar: Calendar = Calendar.current) {
        self.year = year
        self.month = month
        self.calendar = calendar
        self.calendar.timeZone = TimeZone(secondsFromGMT: 0)!
    }
    
    func day(_ dayOfWeek: Int, which: String) -> MeetupDate {
        let matchingDays = getMatchingDaysOfWeek(for: dayOfWeek)
        let date = findMeetupDate(in: matchingDays, which: which)!
        return MeetupDate(date: date)
    }
    
    private func getMatchingDaysOfWeek(for day: Int) -> [Date] {
        let start = calendar.date(from: DateComponents(calendar: calendar, year: year, month: month))!
        let end = calendar.date(byAdding: .month, value: 1, to: start)!
        let matchingDays = DateComponents(calendar: calendar, hour: 1, weekday: day)
        
        var result: [Date] = []
        calendar.enumerateDates(
            startingAfter: start,
            matching: matchingDays,
            matchingPolicy: .strict) {
            date, match, stop  in
            if let date = date {
                if date > end {
                    stop = true
                } else {
                    result.append(date)
                }
            }
        }
        return result
    }
    
    private func findMeetupDate(in input: [Date], which condition: String) -> Date? {
        let condition = Condition(rawValue: condition)
        switch condition {
        case .first:
            return input.first
        case .second:
            return input[1]
        case .third:
            return input[2]
        case .fourth:
            return input[3]
        case .last:
            return input.last
        case .teenth:
            return getTeenth(from: input)
        default:
            return nil
        }
    }
    
    private func getTeenth(from input: [Date]) -> Date? {
        let teenthDates = (13...19)
            .map { DateComponents(calendar: calendar, year: year, month: month, day: $0, hour: 1) }
            .map { calendar.date(from: $0) }
        return input.reduce(into: nil) {
            if teenthDates.contains($1) {
                $0 = $1
            }}
    }
}

enum Condition: String {
    case first = "1st"
    case second = "2nd"
    case third = "3rd"
    case fourth = "4th"
    case last = "last"
    case teenth = "teenth"
}

struct MeetupDate: CustomStringConvertible {
    private let date: Date
    private let formatter: DateFormatter
    
    var description: String {
        return formatter.string(from: date)
    }
    
    init(date: Date, formatter: DateFormatter = MeetupDateFormatter()) {
        self.date = date
        self.formatter = formatter
    }
}

class MeetupDateFormatter: DateFormatter {
    override init() {
        super.init()
        self.dateFormat = "yyyy-MM-dd"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
