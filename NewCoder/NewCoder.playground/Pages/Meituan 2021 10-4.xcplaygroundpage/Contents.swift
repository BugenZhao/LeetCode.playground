let _ = readLine()!
let nums = readLine()!.split(separator: " ").map { Int($0)! }

struct Input: Hashable {
    let start: Int
    let end: Int
    let parent: Int
}

var memo = [Input: Int]()

func dfs(_ inp: Input) -> Int {
    if inp.end <= inp.start { return 0 }
    if let m = memo[inp] { return m }
    
    var ans = Int.max
    for i in (inp.start)..<(inp.end) {
        let l = dfs(Input(start: inp.start, end: i, parent: nums[i]))
        let r = dfs(Input(start: i + 1, end: inp.end, parent: nums[i]))
        ans = min(ans, l + r + nums[i] * inp.parent)
    }
    
    memo[inp] = ans
    return ans
}

print(dfs(Input(start: 0, end: nums.count, parent: 0)))
