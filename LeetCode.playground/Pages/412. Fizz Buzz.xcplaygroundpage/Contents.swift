class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        return (1...n).map{ i in
            var res = ""
            if i.isMultiple(of: 3) { res += "Fizz" }
            if i.isMultiple(of: 5) { res += "Buzz" }
            return res.isEmpty ? "\(i)" : res
        }
    }
}


Solution().fizzBuzz(15)
