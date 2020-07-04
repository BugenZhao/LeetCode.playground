class Solution {
    func dis(_ a: [Int], _ b: [Int]) -> Int {
        return (a[0] - b[0]) * (a[0] - b[0]) + (a[1] - b[1]) * (a[1] - b[1])
    }

    func validSquare(_ p1: [Int], _ p2: [Int], _ p3: [Int], _ p4: [Int]) -> Bool {
        let dises = [dis(p1, p2), dis(p1, p3), dis(p1, p4), dis(p2, p3), dis(p2, p4), dis(p3, p4)].sorted()
        return dises[0] > 0 && dises[0] == dises[1] && dises[1] == dises[2] && dises[2] == dises[3] && dises[4] == dises[5] && dises[4] == 2 * dises[0]
    }
}
