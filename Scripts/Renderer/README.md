# Renderer

Based on *SwiftSyntax*, the renderer walks through the directories and analyzes the syntax of each solution to fetch its metadata.

For example, it can collect the tag info if the following statement appears in the solution:

```swift
let tags: [Tag] = [.marked, .dp, .graph]
```

## Based on

- [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON) for better `JSON` handling
- [SwiftSyntax](https://github.com/apple/swift-syntax) and [SwiftSemantics](https://github.com/SwiftDocOrg/SwiftSemantics) for meta info fetching
- [Rainbow](https://github.com/onevcat/Rainbow) for colorful output in terminal

