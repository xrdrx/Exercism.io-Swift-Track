//Solution goes in Sources
struct Bowling {
    private var frames: [Frame]
    
    init() {
        self.frames = [Frame()]
    }
    
    mutating func roll(pins: Int) throws {
        guard (0...10).contains(pins) else { throw BowlingError.invalidNumberOfPins }
        guard !gameIsFinished() else { throw BowlingError.gameIsOver }
        
        try frames.forEach { try $0.updateWithRoll(pins) }
        
        if newFrameNeeded() {
            frames.append(Frame())
        }
    }
    
    private func gameIsFinished() -> Bool {
        return frames.count == 10 &&
            frames.allSatisfy({ $0.status == .closed })
    }
    
    private func newFrameNeeded() -> Bool {
        return frames.count < 10 &&
            frames.filter({ $0.status == .opened }).count == 0
    }
    
    func score() throws -> Int {
        guard gameIsFinished() else { throw BowlingError.gameInProgress }
        return frames.reduce(0) { $0 + $1.score }
    }
    
    enum BowlingError: Error {
        case invalidNumberOfPins
        case tooManyPinsInFrame
        case gameInProgress
        case gameIsOver
    }
}

class Frame {
    private var rollsLeft: Int = 2
    private var pinsLeft: Int = 10
    private(set) var score: Int = 0
    private(set) var status: FrameStatus = .opened
    
    func updateWithRoll(_ pins: Int) throws {
        guard status != .closed else { return }
        guard pinsLeft >= pins else { throw Bowling.BowlingError.tooManyPinsInFrame }
        
        switch (pins, status) {
        case (pinsLeft, .opened) : //strike or spare
            pinsLeft = 10
            status = .bonus
        case (pinsLeft, .bonus):
            pinsLeft = 10
            rollsLeft -= 1
        default:
            pinsLeft -= pins
            rollsLeft -= 1
        }
        score += pins
        if rollsLeft == 0 { status = .closed }
    }
}

enum FrameStatus {
    case opened
    case bonus
    case closed
}
