//Solution goes in Sources
import Foundation

class Clock {
    private var interval: TimeInterval
    
    private let formatter: DateFormatter
    
    init(hours: Int = 0, minutes: Int = 0, formatter: DateFormatter = ClockFormatter()) {
        self.formatter = formatter
        self.interval = TimeInterval((hours * 60 * 60) + (minutes * 60))
    }
    
    func add(minutes: Int) -> Clock {
        interval += TimeInterval(minutes * 60)
        return self
    }
    
    func subtract(minutes: Int) -> Clock {
        interval -= TimeInterval(minutes * 60)
        return self
    }
}

extension Clock: CustomStringConvertible {
    var description: String {
        return formatter.string(from: Date(timeIntervalSinceReferenceDate: interval))
    }
}

extension Clock: Equatable {
    static func == (lhs: Clock, rhs: Clock) -> Bool {
        lhs.description == rhs.description
    }
}

class ClockFormatter: DateFormatter {
    override init() {
        super.init()
        self.dateFormat = "HH:mm"
        self.timeZone = TimeZone(secondsFromGMT: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
