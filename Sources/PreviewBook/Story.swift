//
//  PreviewBookStory.swift
//  
//
//  Created by Callum Boddy on 23/06/2022.
//

import Foundation
import SwiftUI

public protocol Story: PreviewProvider {
    static var title: String { get }
    static var section: String { get }
    static var delay: TimeInterval { get }
}

extension Story {
    public static var section: String {
        return ""
    }

    public static var delay: TimeInterval {
        return 0
    }
}
