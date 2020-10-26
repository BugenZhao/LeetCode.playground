let tags: [Tag] = [.dp]

class Solution {
    var memo = [0: false, 1: true]
    
    func winnerSquareGame(_ n: Int) -> Bool {
        if let m = memo[n] { return m }
        
        var ans = false
        for i in 1... {
            let nn = n - i * i
            if nn < 0 { break }
            if !winnerSquareGame(nn) { ans = true; break }
        }
        
        memo[n] = ans
        return ans
    }
}
