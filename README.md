# SwiftLintPlugin

SwiftPM build tool plugin for SwiftLint

## Usage

### Package.swift

```swift
dependencies: [
    .package(url: "https://github.com/usami-k/SwiftLintPlugin", branch: "main"),
],
targets: [
    .target(
        name: "MyTarget",
        plugins: [
            .plugin(name: "SwiftLintPlugin", package: "SwiftLintPlugin"),
        ]
    )
]
```
