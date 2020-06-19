//
//  FormatOptions.swift
//  GenReadme
//
//  Created by Bugen Zhao on 6/19/20.
//

import Foundation

struct FormatOptions: OptionSet {
    let rawValue: Int

    static let withTags = FormatOptions(rawValue: 1 << 0)
    static let xcodePath = FormatOptions(rawValue: 1 << 1)
    static let tagPath = FormatOptions(rawValue: 1 << 2)

    static let preset = FormatOptions([.withTags])
}
