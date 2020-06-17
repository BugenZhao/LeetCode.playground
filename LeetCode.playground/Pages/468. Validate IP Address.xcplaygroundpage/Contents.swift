class Solution {
    func validIPAddress(_ IP: String) -> String {
        let v4 = "IPv4"
        let v6 = "IPv6"
        let ne = "Neither"
        if IP.firstIndex(of: ".") != nil {
            let tokens = IP.split(separator: ".", omittingEmptySubsequences: false)
            guard tokens.count == 4,
                tokens.allSatisfy({ $0.count == 1 || $0.firstIndex(of: "0") != $0.startIndex }),
                tokens.allSatisfy({ $0.allSatisfy({ c in c.isNumber }) })
                else { return ne }

            let nums = tokens.compactMap { Int($0, radix: 10) }
            guard nums.count == 4,
                nums.allSatisfy({ 0...255 ~= $0 })
                else { return ne }

            return v4
        } else {
            let tokens = IP.split(separator: ":", omittingEmptySubsequences: false)
            guard tokens.count == 8,
                tokens.allSatisfy({ $0.count <= 4 }),
                tokens.allSatisfy({ $0.allSatisfy({ c in c.isHexDigit }) })
                else { return ne }

            let nums = tokens.compactMap { Int($0, radix: 16) }
            guard nums.count == 8
                else { return ne }

            return v6
        }
    }
}

var f = Solution().validIPAddress

f("172.16.254.1")
f("2001:0db8:85a3:0:0:8A2E:0370:7334")
f("256.256.256.256")
f("2001:0db8:85a3:0:0:8A2E:0370:7334:")
f("0.0.0.-0")
f("2001:0db8:85a3:0:0:-8A2E:0370:7334")


class SolutionRegex {
    func validIPAddress(_ IP: String) -> String {
        if IP.range(of: #"^((25[0-5]|2[0-4]\d|1\d\d|[1-9]\d|\d)\.){3}(25[0-5]|2[0-4]\d|1\d\d|[1-9]\d|\d)$"#,
                    options: [.regularExpression]) != nil { return "IPv4" }
        else if IP.range(of: #"^([\da-f]{1,4}:){7}[\da-f]{1,4}$"#,
                         options: [.regularExpression, .caseInsensitive]) != nil { return "IPv6" }
        else { return "Neither" }
    }
}

f = SolutionRegex().validIPAddress

f("172.16.254.1")
f("2001:0db8:85a3:0:0:8A2E:0370:7334")
f("256.256.256.256")
f("2001:0db8:85a3:0:0:8A2E:0370:7334:")
f("0.0.0.-0")
f("2001:0db8:85a3:0:0:-8A2E:0370:7334")
