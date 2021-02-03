//
//  Contest.swift
//  Renderer
//
//  Created by Bugen Zhao on 8/23/20.
//

import Foundation

typealias ContestList = [Contest]

struct Contest {
    enum Kind: String, CustomStringConvertible {
        case weekly, biweekly
        var description: String {
            switch self {
            case .weekly:
                return "Weekly"
            case .biweekly:
                return "Biweekly"
            }
        }
    }

    var kind: Kind
    var id: Int
    var title: String
    var titleSlug: String
    var path: String
    
    let questionCount: Int = 4

    init(kind: Kind, id: Int, path: String) {
        self.kind = kind
        self.id = id
        self.path = path
        self.title = "\(kind) Contest \(id)"
        self.titleSlug = title.lowercased().replacingOccurrences(of: " ", with: "-")
    }


    func line(with options: FormatOptions = .preset) -> String {
        var line = "- [X] 🔖 [[C]](https://leetcode.com/contest/\(titleSlug)/) "
        line.append("[[S]](\(path)) ")
        line.append("\(title)")
        return line
    }


    static func getList() -> ContestList {
        if let contests = try? fileManager.contentsOfDirectory(atPath: contestsURL.path) {
            return contests.compactMap { contest -> Contest? in
                guard contest.suffix(playgroundSuffix.count) == playgroundSuffix else { return nil }
                let split = contest.dropLast(playgroundSuffix.count).split(separator: " ").map { $0.lowercased() }
                if split.isEmpty { return nil }

                guard let kind = Kind.init(rawValue: split.first!) else { return nil }
                guard let id = Int(split.last!) else { return nil }
                let path = "\(contestsRelativePath)\(contest.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)\("/Pages/")"

                return Contest(kind: kind, id: id, path: path)
            }
        } else {
            return []
        }
    }
}
