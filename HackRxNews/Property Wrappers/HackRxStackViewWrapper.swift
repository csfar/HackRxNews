//
//  HackRxStackViewWrapper.swift
//  HackRxNews
//
//  Created by Artur Carneiro on 14/02/21.
//

import UIKit

/// Responsible for providing a quick and concise way of instantiating a
/// `UIStackView` with a given style.
@propertyWrapper final class HackRxStackViewWrapper {
    @AutoLayout private var stack: HackRxStackView

    var wrappedValue: HackRxStackView {
        return stack
    }

    /// Initializes a new instance of this type.
    /// - Parameter style: The `HackRxStackView` style.
    init(style: HackRxStackView.Style) {
        stack.style(style)
    }
}
