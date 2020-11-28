//
//  HackRxLabel.swift
//  HackRxNews
//
//  Created by Artur Carneiro on 28/11/20.
//

import UIKit

/// Representation of a `HackRxNews` label.
final class HackRxLabel: UILabel {
    // MARK: - Properties
    /// Determines a `HackRxLabel` style.
    enum Style {
        /// A story's title style.
        case title
        /// A story's date of posting style.
        case date
    }

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - API
    /// Styles a `HackRxLabel` according to a `HackRxLabel.Style`.
    func style(_ style: HackRxLabel.Style) {
        switch style {
        case .title:
            styleTitle()
        case .date:
            styleDate()
        }
    }

    /// Styles a `HackRxLabel` as `Style.title`.
    private func styleTitle() {

    }

    /// Styles a `HackRxLabel` as `Style.date`.
    private func styleDate() {

    }
}
