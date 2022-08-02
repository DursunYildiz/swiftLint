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
           
import PackagePlugin

@main
struct SwiftLintPlugin: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        return [
            .buildCommand(
                displayName: "Run SwiftLint for \(target.name)",
                executable: try context.tool(named: "swiftlint").path,
                arguments: [
                    "lint",
                    "--in-process-sourcekit",
                    "--path",
                    target.directory.string
                ],
                environment: [:]
            )
        ]
    }
}

            )
        ]
    }
}
