import Foundation

public final class TestCase {
    public let lines: [String]
    public let count: Int
    public let name: String
    public private(set) var lineNo = 0

    public init?(_ name: String) {
        self.name = name
        guard let path = Bundle.main.path(forResource: name, ofType: nil) else { return nil }
        guard let content = try? String(contentsOfFile: path) else { return nil }
        lines = content.components(separatedBy: .newlines)
        count = lines.map { $0.count }.reduce(0, +)
    }

    public func next<T>() -> T? {
        if lineNo >= lines.endIndex { return nil }
        defer { lineNo += 1 }
        let wrapper = "[\(lines[lineNo])]"
        return (try! JSONSerialization.jsonObject(with: wrapper.data(using: .utf8)!, options: []) as? [T])?.first
    }
}

extension TestCase: CustomStringConvertible {
    public var description: String {
        return "\(Self.self)(\"\(self.name)\", \(lines.count) lines, \(count) chars)"
    }
}
