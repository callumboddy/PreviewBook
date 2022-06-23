import SwiftUI
import Foundation
import UIKit
import XCTest

extension View {

    @MainActor
    internal func convert(padding: Bool = false, delay: TimeInterval) async -> UIView {
        let rootView = padding ? AnyView(self.padding().background(Color.white)) : AnyView(self.background(Color.white))
        let controller = UIHostingController(rootView: rootView)
        controller.view.frame = .zero
        UIApplication.shared.windows.first!.rootViewController?.view.addSubview(controller.view)
        let size = controller.sizeThatFits(in: UIScreen.main.bounds.size)
        controller.view.bounds = CGRect(origin: .zero, size: size)
        controller.view.backgroundColor = .clear
        controller.view.sizeToFit()
        controller.view.largeContentImageInsets = .zero
        controller._disableSafeArea = true
        controller.view.frame = CGRect(x: 0, y: 0, width: controller.view.frame.width, height: controller.view.frame.height)

        return await withCheckedContinuation { continuation in
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                continuation.resume(with: .success(controller.view))
            }
        }
    }
}
