//
//  PreviewBookTemplate.swift
//  
//
//  Created by Callum Boddy on 23/06/2022.
//

import Foundation
import XCTest

public protocol Template {

    var configuration: Configuration { get }

    var stories: [any Story.Type] { get }

    func generate() async

    func testPreviewBook() async throws
}

public extension Template where Self: XCTestCase {

    @MainActor
    func generate() async {
        do {
            let renderer = Renderer()
            try await stories.asyncForEach { story in
                let previews = story._allPreviews
                try await previews.asyncForEach { [story] preview in
                    let name = preview.displayName ?? "\(preview.id)"
                    try await renderer.capture(preview: preview.content, name: "\(story.title)-\(name)", delay: story.delay, configuration: configuration)
                }
            }
        } catch {
            print(error)
            assert(false)
        }
    }
}

