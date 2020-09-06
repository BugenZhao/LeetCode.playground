//: ![65](65_2.jpg)
let tags: [Tag] = [.state, .string, .marked]

class Solution {
    func isNumber(_ s: String) -> Bool {
        let s = s.trimmingCharacters(in: .whitespaces)
        var state = 0
        for c in s {
            switch c {
            case "+", "-":
                switch state {
                case 0:
                    state = 1
                case 4:
                    state = 6
                default:
                    return false
                }
            case "0"..."9":
                switch state {
                case 0, 1, 2:
                    state = 2
                case 3:
                    state = 3
                case 4, 5, 6:
                    state = 5
                case 7, 8:
                    state = 8
                default:
                    return false
                }
            case ".":
                switch state {
                case 0, 1:
                    state = 7
                case 2:
                    state = 3
                default:
                    return false
                }
            case "e":
                switch state {
                case 2, 3, 8:
                    state = 4
                default:
                    return false
                }
            default:
                return false
            }
        }
        return [2, 3, 5, 8].contains(state)
    }
}
