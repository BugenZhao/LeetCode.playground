let tags: [Tag] = [.stack]

extension Character {
    var complement: Character {
        switch self {
        case ")": return "("
        case "]": return "["
        case "}": return "{"
        default: return self
        }
    }
}

class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        for c in s {
            switch c {
            case "(", "[", "{":
                stack.append(c)
            default:
                guard stack.popLast() == c.complement else { return false }
            }
        }
        return stack.isEmpty
    }
}

let f = Solution().isValid

f("()[]{}")
f("{[]}")
f("([)]")
f("")
