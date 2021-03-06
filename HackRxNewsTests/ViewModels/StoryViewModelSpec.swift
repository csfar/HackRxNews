//
//  StoryViewModelSpec.swift
//  HackRxNewsTests
//
//  Created by Artur Carneiro on 21/02/21.
//

import Quick
import Nimble
import RxTest
import RxBlocking
import RxSwift
@testable import HackRxNews

final class StoryViewModelSpec: QuickSpec {
    override func spec() {
        var sut: StoryViewModel!
        var service: NetworkServiceMock!
        var networkManager: NetworkManagerProtocol!

        describe("when initialized") {

            beforeEach {
                let bundle = Bundle(for: type(of: self))
                let jsonURL = bundle.url(forResource: "item-response", withExtension: "json")
                service = NetworkServiceMock(bundle: bundle)
                service.json = jsonURL

                networkManager = NetworkManager(service: service)

                sut = StoryViewModel(storyID: 1006, networkManager: networkManager)
            }

            afterEach {
                sut = nil
                service = nil
            }

            context("and has fetched") {

                it("should have drivers with fetched data") {
                    let data = try! Data(contentsOf: service.json!)
                    let item = try! JSONDecoder().decode(Item.self, from: data)
                    let (title,
                         author,
                         dateOfPosting,
                         numberOfComments,
                         points) = makeStub(from: item)

                    sut.fetch()


                    let sutTitle = try! sut.title.toBlocking(timeout: 1.0).first()!
                    let sutAuthor = try! sut.author.toBlocking(timeout: 1.0).first()!
                    let sutDateOfPosting = try! sut.dateOfPosting.toBlocking(timeout: 1.0).first()!
                    let sutNumberOfComments = try! sut.numberOfComments.toBlocking(timeout: 1.0).first()!
                    let sutPoints = try! sut.points.toBlocking(timeout: 1.0).first()!

                    expect(sutTitle).to(equal(title))
                    expect(sutAuthor).to(equal(author))
                    expect(sutDateOfPosting).to(equal(dateOfPosting))
                    expect(sutNumberOfComments).to(equal(numberOfComments))
                    expect(sutPoints).to(equal(points))
                }
            }

            context("and has not fetched") {

                it("should have drivers with default values") {
                    let sutTitle = try! sut.title.toBlocking(timeout: 1.0).first()!
                    let sutAuthor = try! sut.author.toBlocking(timeout: 1.0).first()!
                    let sutDateOfPosting = try! sut.dateOfPosting.toBlocking(timeout: 1.0).first()!
                    let sutNumberOfComments = try! sut.numberOfComments.toBlocking(timeout: 1.0).first()!
                    let sutPoints = try! sut.points.toBlocking(timeout: 1.0).first()!

                    expect(sutTitle).to(equal("-"))
                    expect(sutAuthor).to(equal("by "))
                    expect(sutDateOfPosting).to(equal("51 years ago"))
                    expect(sutNumberOfComments).to(equal("0 comments"))
                    expect(sutPoints).to(equal("0"))
                }
            }
        }

        func makeStub(from item: Item) -> (String, String, String, String, String) {

            let dateOfCreation = Date(timeIntervalSince1970: item.time)
            let dateFormatter = RelativeDateTimeFormatter()
            dateFormatter.unitsStyle = .full

            return (item.title ?? "-",
                    "by \(item.by)",
                    dateFormatter.localizedString(for: dateOfCreation, relativeTo: Date()),
                    "\(item.descendants ?? 0) comments",
                    "\(item.score ?? 0)")
        }
    }
}
