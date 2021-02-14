//
//  HackRxStackView.swift
//  HackRxNews
//
//  Created by Artur Carneiro on 14/02/21.
//

import UIKit

/// Representation of a `HackRxNews` stack view.
final class HackRxStackView: UIStackView {
    // MARK: - Properties
    /// Available styles of a `HackRxStackView`.
    enum Style {
        /// A style for headers.
        case header
        /// The default style.
        case `default`
        /// A style for details.
        case details
    }

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - API
    /// Styles a `HackRxStackView` according to a `HackRxStackView.Style`.
    func style(_ style: HackRxStackView.Style) {
        switch style {
        case .header:
            styleHeader()
        case .details:
            styleDetails()
        case .default:
            styleDefault()
        }
    }

    // MARK: - Styles
    /// Styles a `HackRxStackView` as `Style.header`.
    private func styleHeader() {
        axis = .vertical
        alignment = .top
        spacing = 10
    }

    /// Styles a `HackRxStackView` as `Style.details`.
    private func styleDetails() {
        axis = .horizontal
        distribution = .fill
        alignment = .fill
    }

    /// Styles a `HackRxStackView` as `Style.default`.
    private func styleDefault() {
        alignment = .fill
        spacing = 10
    }
}
