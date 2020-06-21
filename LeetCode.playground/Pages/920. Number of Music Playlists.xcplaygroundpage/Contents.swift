let tags: [Tag] = [.dp]

class Solution {
    func numMusicPlaylists(_ N: Int, _ L: Int, _ K: Int) -> Int {
        let mod = 1_000_000_007
        var dp = [[Int]](repeating: .init(repeating: 0, count: L + 1), count: N + 1)
        //: `dp[n][l]`: answer using first `n` songs to form a playlist with `L` songs
        dp[0][0] = 1

        for l in 1...L {
            for n in 1...min(N, l) {
                dp[n][l] = dp[n - 1][l - 1] * (N - (n - 1)) //: append a new song
                dp[n][l] += dp[n][l - 1] * max(n - K, 0) % mod //: append an old song, note that the last `K` songs in the playlist [they are different] should not be selected
                dp[n][l] %= mod
            }
        }
        return dp[N][L]
    }
}

let f = Solution().numMusicPlaylists
f(3, 3, 1)
f(5, 5, 0)
f(2, 3, 0)
