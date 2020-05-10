//
//  Writer.swift
//  GenReadme
//
//  Created by Bugen Zhao on 5/10/20.
//

import Foundation

class Writer {
    @discardableResult
    static func writeReadme(_ dict: QuestionDict, to url: URL) -> Bool {
        let count = dict.count
        let solvedCount = dict.filter(\.value.solved).count

        var output = ""
        output += "# LeetCode.playground\n"
        output += "![Language](https://img.shields.io/badge/Language-Swift%20\(swiftVersion)-orange.svg)\n"
        output += "![Progress](https://img.shields.io/badge/Progress-\(solvedCount)%20%2F%20\(count)%20=%20\(String(format: "%.2f", 100.0 * Double(solvedCount) / Double(count)))%25-orange.svg)\n\n"
        output += "Bugen's LeetCode solutions in Swift Playground.\n"

        output += "\n## Tags\n"
        Tag.allCases.forEach { tag in
            output += "- [\(tag)](\(makePath(tag: tag, urlAllowed: true)))\n"
        }

        output += "\n## Problems\n"

        dict.sorted(by: { lhs, rhs in
            if lhs.value.solved == rhs.value.solved { return lhs.key < rhs.key }
            else if lhs.value.solved { return true }
            else { return false }
        }).map(\.value.line).forEach { output += $0 + "\n" }

        output += "\n## How am I generated?\n"
        output += "This generator is based on *Swift*. It walks the directories and *analyzes the syntax of each solution* to fetch its meta info.\n\nFor example, it can collect tags if the following statement appears in the solution:\n\n"
        output += "```swift\nlet tags: [Tag] = [.marked, .dp]\n```\n\n"
        output += "For more details, check [here](./Scripts/GenReadme/)!"


        do { try output.data(using: String.Encoding.utf8)?.write(to: url) }
        catch { return false }
        return true
    }

    @discardableResult
    static func writeTag(_ dict: QuestionDict, tag: Tag, to url: URL) -> Bool {
        let count = dict.count
        let solvedCount = dict.filter(\.value.solved).count

        var output = ""
        output += "# LeetCode.playground\n"
        output += "![Language](https://img.shields.io/badge/Language-Swift%20\(swiftVersion)-orange.svg)\n"
        output += "![Progress](https://img.shields.io/badge/Progress-\(solvedCount)%20%2F%20\(count)%20=%20\(String(format: "%.2f", 100.0 * Double(solvedCount) / Double(count)))%25-orange.svg)\n\n"
        output += "Bugen's LeetCode solutions in Swift Playground.\n"
        output += "## \(tag) Problems\n"

        dict.filter({ $0.value.tags.contains(tag) }).map(\.value.line).forEach { output += $0 + "\n" }

        do { try output.data(using: String.Encoding.utf8)?.write(to: url) }
        catch { return false }
        return true
    }
}
