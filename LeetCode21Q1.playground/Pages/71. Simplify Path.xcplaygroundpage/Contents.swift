let tags: [Tag] = [.stack]

class Solution {
    func simplifyPath(_ path: String) -> String {
        var stack = [Substring]()
        for token in path.split(separator: "/") {
            switch token {
            case "", ".":
                continue
            case "..":
                stack.popLast()
            default:
                stack.append(token)
            }
        }
        
        return stack.isEmpty ? "/" : stack.map { "/\($0)" }.joined()
    }
}

let f = Solution().simplifyPath

f("/a/./b/../../c/")
f("/../")
