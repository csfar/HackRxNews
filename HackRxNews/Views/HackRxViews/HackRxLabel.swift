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
    /// Available styles of a `HackRxLabel`.
    enum Style {
        /// A story's points style.
        case points
        /// A story's date of posting style.
        case date
        /// A story's title style.
        case title
        /// A story's author style.
        case author
        /// A story's comments style.
        case comments
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
        case .points:
            stylePoints()
        case .date:
            styleDate()
        case .title:
            styleTitle()
        case .author:
            styleAuthor()
        case .comments:
            styleComments()
        }
    }

    // MARK: - Styles
    /// Styles a `HackRxLabel` as `Style.points`.
    private func stylePoints() {
        font = UIFont.preferredFont(forTextStyle: .body).bold()
        textColor = .lightGray
        numberOfLines = 0
    }

    /// Styles a `HackRxLabel` as `Style.date`.
    private func styleDate() {
        font = UIFont.preferredFont(forTextStyle: .body)
        textColor = .lightGray
    }

    /// Styles a `HackRxLabel` as `Style.title`.
    private func styleTitle() {
        font = UIFont.preferredFont(forTextStyle: .title2).bold()
        textColor = .black
        numberOfLines = 0
    }

    /// Styles a `HackRxLabel` as `Style.author`.
    private func styleAuthor() {
        font = UIFont.preferredFont(forTextStyle: .body)
        textColor = .black
    }

    /// Styles a `HackRxLabel` as `Style.comments`.
    private func styleComments() {
        font = UIFont.preferredFont(forTextStyle: .body)
        textColor = .lightGray
    }
}
