//
//  UIFont+Extensions.swift
//  HackRxNews
//
//  Created by Artur Carneiro on 28/11/20.
//

import UIKit

extension UIFont {
    /// Sets a font to bold.
    /// - Returns: The current font in bold.
    func bold() -> UIFont {
        guard let newDescriptor = fontDescriptor.withSymbolicTraits(.traitBold) else {
            return self
        }

        return UIFont(descriptor: newDescriptor, size: 0)
    }

    /// Sets a font to serif.
    /// - Returns: The serif version of the current font.
    func serif() -> UIFont {
        guard let newDescriptor = fontDescriptor.withDesign(.serif) else {
            return self
        }

        return UIFont(descriptor: newDescriptor, size: 0)
    }
}
