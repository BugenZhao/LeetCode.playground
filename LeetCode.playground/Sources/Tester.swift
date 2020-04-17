import Cocoa

public func testEqual<T:Equatable>(_ lhs: T, _ rhs: T, _ message: String? = nil) {
    print("LHS:", lhs)
    print("RHS:", rhs)
    guard lhs == rhs else {
        fatalError("=> TEST FAILED - \(message ?? "")")
    }
    print("=> TEST SUCCESS!")
}
