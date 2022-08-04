//
//  File.swift
//
//
//  Created by Dursun YILDIZ on 29.07.2022.
//
import PackagePlugin
import Foundation

@main
struct SwiftLintPlugin: BuildToolPlugin {
    var isPreview: Bool {
        ProcessInfo
            .processInfo
            .environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
    func createBuildCommands(
        context: PluginContext,
        target: Target
    ) async throws -> [Command] {
        if isPreview {
            return []
        }
        return [
             .buildCommand(
                displayName: "Linting \(target.name)...",
                executable: try context.tool(named: "swiftlint").path,
                arguments: [
                    "lint",
                    "--in-process-sourcekit",
                    "--config",
                    "\(context.package.directory.string)/Plugins/SwiftLintPlugin/.swiftlint.yml",
                    target.directory.string   // only lint the files in the target directory
                ],
                environment: [:]
            )
        ]
    }
}
