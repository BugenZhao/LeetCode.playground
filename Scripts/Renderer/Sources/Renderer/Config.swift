//
//  Config.swift
//  GenReadme
//
//  Created by Bugen Zhao on 5/10/20.
//

import Foundation

let difficultyEmojis = ["🔞", "😊", "🤨", "😫", "📝"]
let swiftVersion = "5.3"

var leetCodeURL = URL(string: "https://leetcode.com/api/problems/algorithms/")

let fileManager = FileManager.default

let currentURL = URL(fileURLWithPath: fileManager.currentDirectoryPath)
let localCacheURL = URL(fileURLWithPath: "./Scripts/Renderer/Resources/Questions.json", relativeTo: currentURL)
let pagesRelativePaths = try! fileManager.contentsOfDirectory(atPath: "./").filter { $0.hasPrefix("LeetCode") && $0.hasSuffix(".playground") }.map { $0 + "/Pages/" }
let pagesURLs = pagesRelativePaths.map { URL(fileURLWithPath: $0, relativeTo: currentURL) }
let contestsRelativePath = "./Contests/"
let contestsURL = URL(fileURLWithPath: contestsRelativePath, relativeTo: currentURL)

let readmeURL = URL(fileURLWithPath: "./README.md", relativeTo: currentURL)
let helloPageURL = URL(fileURLWithPath: "./LeetCode.playground/Pages/Hello.xcplaygroundpage/Contents.swift", relativeTo: currentURL)

func makePath(tag: Tag, urlAllowed: Bool = false) -> String {
    let path = "./Tags/\(tag.rawDescription).md"
    if urlAllowed { return path.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)! }
    else { return path }
}

func makeURL(tag: Tag, urlAllowed: Bool = false) -> URL {
    return URL(fileURLWithPath: makePath(tag: tag, urlAllowed: urlAllowed), relativeTo: currentURL)
}

let pageSuffixCount = ".xcplaygroundpage".count
let playgroundSuffix = ".playground"

let dateFormatter = DateFormatter()

let intro = """
struct LeetCodePlayground: CustomStringConvertible {
    let language    = "Swift \(swiftVersion)"
    let description = "Bugen's LeetCode solutions in Swift Playground."

    typealias Priority = UInt
    enum Goal: Priority {
        case algorithm  = 0
        case clarity    = 1
        case runtime    = 2
    }

    enum Difficulty: String {
        case easy       = "😊"
        case medium     = "🤨"
        case hard       = "😫"
        case marked     = "🔞"
        case annoying   = "🤬"
    }
}
"""

let languageBadge = "![Language](https://img.shields.io/badge/Language-Swift%20\(swiftVersion)-orange.svg)\n"
