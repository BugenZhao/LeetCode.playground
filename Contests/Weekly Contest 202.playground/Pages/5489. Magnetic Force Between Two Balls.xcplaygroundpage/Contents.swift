class Solution {
    func maxDistance(_ position: [Int], _ m: Int) -> Int {
        let position = position.sorted()

        func ok (_ step: Int) -> Bool {
            var rem = m - 1
            var cur = position[0]
            while rem > 0 {
                let next = position.binarySearch { $0 < cur + step }
                if next == position.endIndex { break }
                cur = position[next]
                rem -= 1
            }
            return rem == 0
        }

        let range = 1...position.max()!
        return range[range.index(before: range.binarySearch { ok($0) })]
    }
}

let f = Solution().maxDistance

f([1, 2, 3, 4, 7], 3)
f([1, 2, 3], 3)
f([5, 4, 3, 2, 1, 1000000000], 2)
