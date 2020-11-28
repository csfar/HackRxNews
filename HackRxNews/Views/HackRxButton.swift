//
//  HackRxButton.swift
//  HackRxNews
//
//  Created by Artur Carneiro on 28/11/20.
//

import UIKit

/// Representation of a `HackRxNews` button.
final class HackRxButton: UIButton {
    // MARK: - Properties
    /// Availables styles of a `HackRxButton`.
    enum Style {
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
    /// Styles a `HackRxButton` according to a `HackRxButton.Style`.
    func style(_ style: HackRxButton.Style) {
        switch style {
        case .title:
            styleTitle()
        case .author:
            styleAuthor()
        case .comments:
            styleComments()
        }
    }

    // MARK: - Styles
    /// Styles a `HackRxButton` as `Style.title`.
    private func styleTitle() {

    }

    /// Styles a `HackRxButton` as `Style.author`.
    private func styleAuthor() {

    }

    /// Styles a `HackRxButton` as `Style.comments`.
    private func styleComments() {

    }
}
