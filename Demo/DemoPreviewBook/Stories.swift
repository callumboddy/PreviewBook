//
//  Stories.swift
//  DemoPreviewBook
//
//  Created by Callum Boddy on 22/06/2022.
//

import Foundation
import PreviewBook
@testable import Demo

extension Colors_Previews: PreviewBook.Story {
    public static var title: String {
        "Colours"
    }
}

extension Text_Previews: PreviewBook.Story {
    public static var title: String {
        "Text Styles"
    }
}

extension AysncImage_Previews: PreviewBook.Story {
    public static var title: String {
        "Async Images"
    }

    public static var delay: TimeInterval {
        return 2
    }
}

extension ContentView_Previews: PreviewBook.Story {
    public static var title: String {
        "ContentView"
    }
}
