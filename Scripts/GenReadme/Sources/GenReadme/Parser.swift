//
//  Parser.swift
//  GenReadme
//
//  Created by Bugen Zhao on 5/10/20.
//

import Foundation
import SwiftSyntax
import SwiftSemantics


class Parser {
    static func parseTags(_ url: URL) -> (tags: [Tag], marked: Bool) {
        guard let tree = try? SyntaxParser.parse(url) else { return ([], false) }

        let collector = DeclarationCollector()
        collector.walk(tree)
        guard let tagVariable = collector.variables.first(where: { $0.name == "tags" })
            else { return ([], false) }

        guard let tagStrings = tagVariable.initializedValue?.split(whereSeparator:
                    { [".", "[", "]", ",", " ", "\n"].contains($0) }
        ).map({ String($0) }) else { return ([], false) }

        var tags = [Tag]()
        var marked = false
        tagStrings.forEach { str in
            if let tag = Tag(rawValue: str) {
                tags.append(tag)
                if tag == .marked { marked = true }
            }
        }
        return (tags, marked)
    }
}
