//
//  AutoLayout.swift
//  HackRxNews
//
//  Created by Artur Carneiro on 27/11/20.
//

import UIKit

/// Responsible for providing a convinient way of instatianting a `UIView` and its subclasses
/// ready for Auto Layout programmatically.
@propertyWrapper final class AutoLayout<T: UIView> {

    private lazy var view: T = {
        let view = T(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var wrappedValue: T {
        return view
    }
}
