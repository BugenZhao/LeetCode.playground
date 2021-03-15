let n = Int(readLine()!)!
let str = readLine()!

var curr = 0
var ans = 0

for c in str {
    if c == "E" {
        curr = max(curr + 1, 1)
    } else {
        curr -= 1
    }
    ans = max(ans, curr)
}

print(ans)
