//
//  AutoLayoutTests.swift
//  HackRxNewsTests
//
//  Created by Artur Carneiro on 28/11/20.
//

import XCTest
@testable import HackRxNews

final class AutoLayoutTests: XCTestCase {
    @AutoLayout var sut: UIView

    func test_TranslatesAutoresizingMaskIntoConstraints_equalFalse() {
        XCTAssertFalse(sut.translatesAutoresizingMaskIntoConstraints)
    }

    func test_Frame_asZero() {
        XCTAssertEqual(sut.frame, CGRect(x: 0, y: 0, width: 0, height: 0))
    }
}
