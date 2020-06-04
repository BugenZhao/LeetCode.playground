//
//  Parser.swift
//  GenReadme
//
//  Created by Bugen Zhao on 5/10/20.
//

import Foundation
import SwiftSemantics
import SwiftSyntax

class Parser {
    static func parseTags(_ url: URL) -> [Tag] {
        guard let tree = try? SyntaxParser.parse(url) else { return [] }

        let collector = DeclarationCollector()
        collector.walk(tree)
        guard let tagVariable = collector.variables.first(where: { $0.name == "tags" })
        else { return [] }

        guard let tagStrings = tagVariable.initializedValue?.split(whereSeparator:
            { [".", "[", "]", ",", " ", "\n"].contains($0) }
        ).map({ String($0) }) else { return [] }

        return tagStrings.compactMap { Tag(rawValue: $0) }
    }
}
