let tags: [Tag] = [.stack, .ON]

class Solution {
    func asteroidCollision(_ asteroids: [Int]) -> [Int] {
        var stack = [Int]()
        for ast in asteroids {
            if stack.isEmpty || ast > 0 {
                stack.append(ast)
            } else { // ast < 0
                let exist = { () -> Bool in 
                    while let last = stack.last {
                        if last < 0 {
                            return true
                        } else if last < -ast {
                            stack.removeLast()
                        } else if last == -ast {
                            stack.removeLast()
                            return false
                        } else { // last > -ast
                            return false
                        }
                    }
                    return true
                }()
                if exist { stack.append(ast) }
            }
        }

        return stack
    }
}


Solution().asteroidCollision([8, -8])
