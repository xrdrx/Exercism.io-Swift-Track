//Solution goes in Sources
import Foundation

class Gigasecond {
    private let formatter: DateFormatter
    private let date: Date
    
    private let gigasecond: TimeInterval = 1_000_000_000
    
    var description: String {
        return formatter.string(from: date.addingTimeInterval(gigasecond))
    }
    
    init?(from stringDate: String, formatter: DateFormatter = GigaFormatter()) {
        self.formatter = formatter
        guard let date = formatter.date(from: stringDate) else { return nil }
        self.date = date
    }
}

class GigaFormatter: DateFormatter {
    override init() {
        super.init()
        self.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        self.timeZone = TimeZone(secondsFromGMT: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
