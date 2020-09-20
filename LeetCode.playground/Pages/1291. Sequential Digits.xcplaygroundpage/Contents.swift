let tags: [Tag] = [.dfs]

class Solution {
    func sequentialDigits(_ low: Int, _ high: Int) -> [Int] {
        var ans = [Int]()
        func worker(_ num: Int) {
            if num > high { return }
            if num >= low { ans.append(num) }
            if num % 10 != 9 { worker(num * 10 + num % 10 + 1) }
        }
        (1...9).forEach(worker)
        return ans.sorted()
    }
}
