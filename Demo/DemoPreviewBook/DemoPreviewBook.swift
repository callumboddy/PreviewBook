//
//  DemoPreviewBook.swift
//  DemoPreviewBook
//
//  Created by Callum Boddy on 22/06/2022.
//

import XCTest
import PreviewBook
@testable import Demo

final class DemoPreviewBook: XCTestCase, PreviewBook.Template {

    let configuration = PreviewBook.Configuration(root: #filePath)

    var stories: [any PreviewBook.Story.Type] = [
        Colors_Previews.self,
        Text_Previews.self,
        AysncImage_Previews.self,
        ContentView_Previews.self
    ]

    func testPreviewBook() async throws { await generate() }
}
