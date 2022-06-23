//
//  File.swift
//  
//
//  Created by Callum Boddy on 23/06/2022.
//

import Foundation

public struct Configuration {

    public enum ImageExportFileFormat {
        case png
        case jpeg

        var `extension`: String {
            switch self {
            case .png: return ".png"
            case .jpeg: return ".jpg"
            }
        }
    }

    public let directory: URL

    let format: ImageExportFileFormat

    public init(root: String, format: ImageExportFileFormat = .png) {
        let directory = URL(fileURLWithPath: root).deletingLastPathComponent().deletingLastPathComponent()
        self.directory = directory.appendingPathComponent("PreviewBook")
        self.format = format
        do {
            try FileManager.default.createDirectory(at: imagesDirectory, withIntermediateDirectories: true, attributes: nil)
        } catch {
            fatalError("PreviewBook - unable to create image directory")
        }
    }

    var imagesDirectory: URL {
        return directory.appendingPathComponent("Images")
    }
}
