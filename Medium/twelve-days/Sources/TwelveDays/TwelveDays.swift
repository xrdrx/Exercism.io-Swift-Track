//Solution goes in Sources
struct TwelveDaysSong {
    private static let days = [
        "zero",
        "first",
        "second",
        "third",
        "fourth",
        "fifth",
        "sixth",
        "seventh",
        "eighth",
        "ninth",
        "tenth",
        "eleventh",
        "twelfth"
    ]
    
    private static let items = [
        "none",
        "a Partridge in a Pear Tree",
        "two Turtle Doves, and",
        "three French Hens,",
        "four Calling Birds,",
        "five Gold Rings,",
        "six Geese-a-Laying,",
        "seven Swans-a-Swimming,",
        "eight Maids-a-Milking,",
        "nine Ladies Dancing,",
        "ten Lords-a-Leaping,",
        "eleven Pipers Piping,",
        "twelve Drummers Drumming,"
    ]
    
    static func verse(_ number: Int) -> String {
        return "On the \(getDay(number)) day of Christmas my true love gave to me: \(getItem(forDay: number))."
    }
    
    static func verses(_ start: Int, _ end: Int) -> String {
        return (start...end)
            .map { verse($0) }
            .joined(separator: "\n")
    }
    
    static func sing() -> String {
        return verses(1, 12)
    }
    
    private static func getDay(_ number: Int) -> String {
        return days[number]
    }
    
    private static func getItem(forDay number: Int) -> String {
        if number == 1 { return items[number] }
        return items[number] + " " + getItem(forDay: number - 1)
    }
    
}
