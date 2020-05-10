# GenReadme

This generator is based on *Swift*. It walks the directories and *analyzes the syntax of each solution* to fetch its meta info.

For example, it can collect tags if the following statement appears in the solution:

```swift
let tags: [Tag] = [.marked, .dp]
```

It is based on the Swift packages:

- [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON) for better `JSON` handling
- [SwiftSyntax](https://github.com/apple/swift-syntax) and [SwiftSemantics](https://github.com/SwiftDocOrg/SwiftSemantics) for meta info fetching
- [Rainbow](https://github.com/onevcat/Rainbow) for colorful output in terminal

