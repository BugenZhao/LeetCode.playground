//
//  Memoization.swift
//  Simulator
//
//  Created by Bugen Zhao on 2020/4/23.
//

import Foundation

public func memoize<T:Hashable, U>(function: @escaping (T) -> U) -> ((T) -> (U)) {
    var cache = [T: U]()
    return { input in
        if let cached = cache[input] { return cached }
        let result = function(input)
        cache[input] = result
        return result
    }
}
