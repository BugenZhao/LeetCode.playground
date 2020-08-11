let tags: [Tag] = [.math]

class Solution {
    func largestMultipleOfThree(_ digits: [Int]) -> String {
        var ds = (0..<3).map { r in digits.filter { $0 % 3 == r }.sorted(by: >) }

        switch digits.reduce(0, +) % 3 {
        case 1:
            if !ds[1].isEmpty { ds[1].removeLast() }
            else if ds[2].count >= 2 { ds[2].removeLast(2) }
            else { return "" }
        case 2:
            if !ds[2].isEmpty { ds[2].removeLast() }
            else if ds[1].count >= 2 { ds[1].removeLast(2) }
            else { return "" }
        default:
            break
        }

        let str = ds.flatMap { $0 }.sorted(by: >).map { "\($0)" }.joined()
        return str.first == "0" ? "0" : str
    }
}

let f = Solution().largestMultipleOfThree

f([8, 1, 9])
f([8, 6, 7, 1, 0])
f([1])
f([1, 0])
f([3, 6, 9, 2, 2, 0, 0])
f([3, 6, 9, 2, 1, 0, 0])
f([3, 6, 9, 1, 1, 0, 0])
