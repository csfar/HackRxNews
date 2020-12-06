//
//  NetworkManagerSpec.swift
//  HackRxNewsTests
//
//  Created by Artur Carneiro on 06/12/20.
//

import Quick
import Nimble
@testable import HackRxNews

final class NetworkManagerSpec: QuickSpec {
    override func spec() {
        var service: NetworkServiceMock!
        var sut: NetworkManager!
        describe("network manager") {
            context("when initialized") {
                context("and performs a request") {
                    beforeEach {
                        let bundle = Bundle(for: type(of: self))
                        service = NetworkServiceMock(bundle: bundle)
                        sut = NetworkManager(service: service)
                    }

                    afterEach {
                        service = nil
                        sut = nil
                    }

                    it("should return the top stories") {
                        let urlRequest = URLRequest(url: Endpoint.topStories.url!)
                        let stubJSONURL = service.bundle.url(forResource: "topstories-response", withExtension: "json")
                        let stubJSONData = try! Data(contentsOf: stubJSONURL!)

                        service.json = stubJSONURL

                        let observable = sut.perform(urlRequest, for: [ItemID].self)
                            .asObservable()
                    }
                }
            }
        }
    }
}
