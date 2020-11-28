//
//  HackRxButtonWrapper.swift
//  HackRxNews
//
//  Created by Artur Carneiro on 28/11/20.
//

import UIKit

/// Responsible for providing a quick and concise way of instantiating
/// a `HackRxButton` with a style.
@propertyWrapper final class HackRxButtonWrapper {
    @AutoLayout private var button: HackRxButton

    var wrappedValue: HackRxButton {
        return button
    }

    /// Initializes a new instance of this type.
    /// - Parameter style: The `HackRxButton` style.
    init(style: HackRxButton.Style) {
        button.style(style)
    }
}
