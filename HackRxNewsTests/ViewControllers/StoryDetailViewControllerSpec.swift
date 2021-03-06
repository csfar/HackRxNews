//
//  StoryDetailViewControllerSpec.swift
//  HackRxNewsTests
//
//  Created by Artur Carneiro on 06/03/21.
//

import Quick
import Nimble
import RxSwift

@testable import HackRxNews

final class StoryDetailViewControllerSpec: QuickSpec {
    override func spec() {
        var sut: StoryDetailViewController!
        var viewModelMock: StoryViewModelMock!

        beforeEach {
            viewModelMock = StoryViewModelMock()
            sut = StoryDetailViewController(storyViewModel: viewModelMock)
        }

        afterEach {
            viewModelMock = nil
            sut = nil
        }

        describe("when initialized") {
            it("should set up bindings for Detail view") {
                let item = Item()

                viewModelMock.observable = Observable.of(item)

                sut.viewDidLoad()

                expect(viewModelMock.didSetTitleBinding).to(beTrue())
                expect(viewModelMock.didSetAuthorBinding).to(beTrue())
                expect(viewModelMock.didSetDateOfPostingBinding).to(beTrue())
                expect(viewModelMock.didSetNumberOfCommentsBinding).to(beTrue())
                expect(viewModelMock.didSetPointsBinding).to(beTrue())
                expect(viewModelMock.didFetch).to(beTrue())
            }
        }
    }
}
