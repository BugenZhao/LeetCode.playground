let _ = readLine()!
let nums = readLine()!.split(separator: " ").map{ Int($0)! }.sorted()
let ans = zip(nums, 1...nums.count).map{ abs($0 - $1) }.reduce(0, +)
print(ans)
