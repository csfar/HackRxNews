//
//  HackRxLabelWrapper.swift
//  HackRxNews
//
//  Created by Artur Carneiro on 28/11/20.
//

import UIKit

/// Responsible for providing a quick and concise way of instantiating
/// a `HackRxLabel` with a style.
@propertyWrapper final class HackRxLabelWrapper {
    @AutoLayout private var label: HackRxLabel

    var wrappedValue: HackRxLabel {
        return label
    }

    /// Initializes a new instance of this type.
    /// - Parameter style: The `HackRxLabel` style.
    init(style: HackRxLabel.Style) {
        label.style(style)
    }
}
