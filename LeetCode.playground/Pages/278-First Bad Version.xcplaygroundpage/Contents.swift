// Binary Search

/**
 * The knows API is defined in the parent class VersionControl.
 *     func isBadVersion(_ version: Int) -> Bool{}
 */

class VersionControl {
    private let firstBad: Int

    func isBadVersion(_ version: Int) -> Bool {
        return version >= firstBad
    }

    init(_ firstBad: Int) {
        self.firstBad = firstBad
    }
}

class Solution: VersionControl {
    func firstBadVersion(_ n: Int) -> Int {
        var lo = 1
        var hi = n
        while lo < hi {
            let mid = (lo + hi) / 2
            if isBadVersion(mid) { hi = mid }
            else { lo = mid + 1 }
        }
        return lo
    }
}

for i in 1...100 {
    for j in 1...i {
        assert(Solution(j).firstBadVersion(i) == j)
    }
}
