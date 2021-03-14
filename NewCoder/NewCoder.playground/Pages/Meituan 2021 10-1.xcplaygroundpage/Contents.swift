let line1 = readLine()!.split(separator: " ")
let line2 = readLine()!.split(separator: " ")

let n = Int(line1[0])!
let x = Int(line1[1])!
let y = Int(line1[2])!
let nums = line2.map{ Int($0)! }.sorted(by: >)

func solve() {
    if n <= 2 {
        print(nums[0])
        return
    }
    if 2 * x > n || 2 * y < n {
        print(-1)
        return
    }
    let yy = min(nums.count - 1, y, nums.count - x)
    print(nums[yy])
}

solve()
