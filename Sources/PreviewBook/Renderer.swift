//
//  Renderer.swift
//  
//
//  Created by Callum Boddy on 23/06/2022.
//

import Foundation
import SwiftUI
import UIKit

@MainActor
public class Renderer {

    public enum RenderError: Error {
        case unableToGenerateImage
    }

    public init() {

    }

    public func capture(preview: some View, name: String, delay: TimeInterval, configuration: PreviewBook.Configuration) async -> Bool {
        let view = await host(content: preview, delay: delay)
        let image = convert(view)
        try! await store(image: image, with: name, configuration: configuration)
        return true
    }

    private func convert(_ view: UIView) -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: view.bounds)
        return renderer.image { rendererContext in
            view.layer.render(in: rendererContext.cgContext)
        }
    }

    private func host(content: some View, delay: TimeInterval, padding: Bool = false) async -> UIView {
        let view = await content.convert(delay: delay)
        return view
    }

    private func store(image : UIImage, with name: String, configuration: PreviewBook.Configuration) async throws {

        guard let data = image.pngData() else {
            throw Renderer.RenderError.unableToGenerateImage
        }

        do {
            let saveDir = URL(fileURLWithPath: configuration.imagesDirectory.path, isDirectory: true)
            let filePath = saveDir.appendingPathComponent("\(name)\(configuration.format.extension)")
            try data.write(to: filePath)
            return
        } catch {
            throw Renderer.RenderError.unableToGenerateImage
        }
    }
}
