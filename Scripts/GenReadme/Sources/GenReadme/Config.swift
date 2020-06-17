//
//  Config.swift
//  GenReadme
//
//  Created by Bugen Zhao on 5/10/20.
//

import Foundation

let difficultyEmojis = ["🔞", "😊", "🤨", "😫", "📝"]
let swiftVersion = "5.2"

let leetCodeURL = URL(string: "https://leetcode.com/api/problems/algorithms/")

let fileManager = FileManager.default

let currentURL = URL(fileURLWithPath: fileManager.currentDirectoryPath)
let localCacheURL = URL(fileURLWithPath: "./Scripts/GenReadme/Resources/Questions.json", relativeTo: currentURL)
let pagesRelativePath = "./LeetCode.playground/Pages/"
let pagesURL = URL(fileURLWithPath: pagesRelativePath, relativeTo: currentURL)

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

let dateFormatter = DateFormatter()
