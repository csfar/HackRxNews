//
//  NetworkManagerSpec.swift
//  HackRxNewsTests
//
//  Created by Artur Carneiro on 06/12/20.
//

import Quick
import Nimble
import RxSwift
@testable import HackRxNews

final class NetworkManagerSpec: QuickSpec {
    override func spec() {
        var service: NetworkServiceMock!
        var sut: NetworkManager!
        var disposeBag: DisposeBag!
        describe("network manager") {
            describe("performs request") {
                beforeEach {
                    disposeBag = DisposeBag()

                    let bundle = Bundle(for: type(of: self))
                    service = NetworkServiceMock(bundle: bundle)
                    sut = NetworkManager(service: service)
                }

                afterEach {
                    disposeBag = nil
                    print(service.state)
                    service = nil
                    sut = nil
                }

                context("successfully") {

                    it("should return the top stories") {
                        let urlRequest = URLRequest(url: Endpoint.topStories.url!)
                        let stubJSONURL = service.bundle.url(forResource: "top-stories-response", withExtension: "json")
                        let stubJSONData = try! Data(contentsOf: stubJSONURL!)

                        service.json = stubJSONURL

                        var storiesID: [ItemID] = []

                        sut.perform(urlRequest, for: [ItemID].self).subscribe { (items) in
                            storiesID = items
                        }.disposed(by: disposeBag)

                        let decodedStoriesID = try! JSONDecoder().decode([ItemID].self, from: stubJSONData)

                        expect(storiesID).to(equal(decodedStoriesID))
                    }

                    it("should return an item") {
                        let urlRequest = URLRequest(url: Endpoint.topStories.url!)
                        let stubJSONURL = service.bundle.url(forResource: "item-response", withExtension: "json")
                        let stubJSONData = try! Data(contentsOf: stubJSONURL!)

                        service.json = stubJSONURL

                        var item: ItemModel!

                        sut.perform(urlRequest, for: ItemModel.self).subscribe { (_item) in
                            item = _item
                        }.disposed(by: disposeBag)

                        let decodedItem = try! JSONDecoder().decode(ItemModel.self, from: stubJSONData)

                        expect(item).to(equal(decodedItem))
                    }
                }

                context("unsuccessfully") {
                    it("because of a failed request") {
                        let urlRequest = URLRequest(url: Endpoint.topStories.url!)

                        service.state = .failure

                        var error: NetworkServiceError!

                        sut.perform(urlRequest, for: [ItemID].self).subscribe { event in
                            if let _error = event.error {
                                error = (_error as! NetworkServiceError)
                            }
                        }.disposed(by: disposeBag)

                        expect(error).toNot(beNil()).to(equal(NetworkServiceError.requestFailed))
                    }

                    it("because of a unexpected response type") {
                        let urlRequest = URLRequest(url: Endpoint.topStories.url!)

                        service.state = .unexpectedResponseType

                        var error: NetworkServiceError!

                        sut.perform(urlRequest, for: [ItemID].self).subscribe { event in
                            if let _error = event.error {
                                error = (_error as! NetworkServiceError)
                            }
                        }.disposed(by: disposeBag)

                        expect(error).toNot(beNil()).to(equal(NetworkServiceError.unexpectedResponseType))
                    }

                    it("because of missing data") {
                        let urlRequest = URLRequest(url: Endpoint.topStories.url!)

                        service.state = .missingData

                        var error: NetworkServiceError!

                        sut.perform(urlRequest, for: [ItemID].self).subscribe { event in
                            if let _error = event.error {
                                error = (_error as! NetworkServiceError)
                            }
                        }.disposed(by: disposeBag)

                        expect(error).toNot(beNil()).to(equal(NetworkServiceError.missingData))
                    }

                    it("because of an unexpected HTTP status code") {
                        let urlRequest = URLRequest(url: Endpoint.topStories.url!)
                        let stubJSONURL = service.bundle.url(forResource: "top-stories-response", withExtension: "json")
                        
                        service.json = stubJSONURL
                        service.statusCode = 404

                        var error: NetworkServiceError!

                        sut.perform(urlRequest, for: [ItemID].self).subscribe { event in
                            if let _error = event.error {
                                error = (_error as! NetworkServiceError)
                            }
                        }.disposed(by: disposeBag)

                        expect(error).toNot(beNil()).to(equal(NetworkServiceError.unexpectedHTTPStatusCode))
                    }
                }
            }
        }
    }
}
