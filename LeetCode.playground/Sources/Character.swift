import Foundation

public extension Character {
    var alphaOrder: Int {
        return Int(self.asciiValue! - 0x61)
    }
}
