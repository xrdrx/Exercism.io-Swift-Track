//Solution goes in Sources
struct CircularBuffer<T> {
    private let capacity: Int
    private var buffer: [T]
    
    init(capacity: Int) {
        self.capacity = capacity
        self.buffer = []
    }
    
    mutating func read() throws -> T {
        guard !buffer.isEmpty else {
            throw CircularBufferError.bufferEmpty
        }
        return buffer.removeFirst()
    }
    
    mutating func write(_ value: T) throws {
        guard !isFull() else {
            throw CircularBufferError.bufferFull
        }
        buffer.append(value)
    }
    
    mutating func clear() {
        buffer.removeAll()
    }
    
    mutating func overwrite(_ value: T) {
        if isFull() { buffer.removeFirst(1) }
        buffer.append(value)
    }
    
    private func isFull() -> Bool {
        return buffer.count == capacity
    }
}

enum CircularBufferError: Error {
    case bufferEmpty
    case bufferFull
}
