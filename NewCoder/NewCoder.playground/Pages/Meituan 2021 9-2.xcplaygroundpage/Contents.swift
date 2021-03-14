let x = Int(readLine()!.split(separator: " ")[1])!
let nums = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)
let i = nums.firstIndex { n in n == 0 || n < nums[x - 1] } ?? nums.endIndex
print(i)
