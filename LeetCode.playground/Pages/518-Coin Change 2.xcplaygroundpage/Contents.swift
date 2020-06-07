let tags: [Tag] = [.dp]

class SolutionD {
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        if amount == 0 { return 0 }
        if coins.count == 0 { return 0 }

        var dp = [[Int]](repeating: .init(repeating: 0, count: amount + 1), count: coins.count + 1)
        for co in 1...coins.count {
            dp[co][0] = 1
            for am in 1...amount {
                dp[co][am] = dp[co - 1][am] + (am >= coins[co - 1] ? dp[co][am - coins[co - 1]] : 0)
            }
        }
        return dp.last!.last!
    }
}

class Solution {
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        if amount == 0 { return 1 }
        if coins.count == 0 { return 0 }

        var dp = [Int](repeating: 0, count: amount + 1); dp[0] = 1
        for coin in coins {
            if coin > amount { continue }
            for am in coin...amount { dp[am] += dp[am - coin] * 1 }
        }
        return dp.last!
    }
}

let f = Solution().change

f(5, [1, 2, 5])
f(5000, [102, 89, 76, 63, 50, 37, 24, 11])



class SolutionR {
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        var memo = [[Int?]](repeating: .init(repeating: nil, count: coins.count + 1), count: amount + 1)
        func worker(_ amount: Int, _ availableCoins: ArraySlice<Int>) -> Int {
            if amount < 0 { return 0 }
            if availableCoins.isEmpty { return amount == 0 ? 1 : 0 }
            if memo[amount][availableCoins.count] != nil { return memo[amount][availableCoins.count]! }

            let count = worker(amount, availableCoins.dropFirst())
                + worker(amount - availableCoins.first!, availableCoins)

            memo[amount][availableCoins.count] = count
            return count
        }

        return worker(amount, coins[0...])
    }
}


let g = Solution().change

g(5, [1, 2, 5])
g(5000, [102, 89, 76, 63, 50, 37, 24, 11])
