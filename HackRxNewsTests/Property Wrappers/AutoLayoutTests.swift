//
//  AutoLayoutTests.swift
//  HackRxNewsTests
//
//  Created by Artur Carneiro on 28/11/20.
//

import XCTest
import Nimble
@testable import HackRxNews

final class AutoLayoutTests: XCTestCase {
    @AutoLayout var sut: UIView

    func test_TranslatesAutoresizingMaskIntoConstraints_equalFalse() {
        let view = sut
        expect(view.translatesAutoresizingMaskIntoConstraints).to(beFalse())
    }

    func test_Frame_asZero() {
        let view = sut
        expect(view.frame).to(equal(CGRect.zero))
    }
}
