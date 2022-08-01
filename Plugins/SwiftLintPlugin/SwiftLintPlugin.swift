//
//  File.swift
//
//
//  Created by Dursun YILDIZ on 29.07.2022.
//

import Foundation

import PackagePlugin

@main
struct SwiftLintPlugin: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        let packageURL = URL(fileURLWithPath: #file).deletingLastPathComponent()
        let fileURL = packageURL.appendingPathComponent("swiftlint" + ".yml")
      return  [
        
            .buildCommand(
                displayName: "Linting \(target.name)...",
                executable: try context.tool(named: "swiftlint").path,
                arguments: [
                    "lint",
                    "--in-process-sourcekit",
                    "--config",
                    fileURL.description,
                    "--path",
                    target.directory.string // only lint the files in the target directory
                ],
                environment: [:]
            )
        ]
    }
}
