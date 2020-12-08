//
//  NetworkServiceMock.swift
//  HackRxNewsTests
//
//  Created by Artur Carneiro on 06/12/20.
//
// swiftlint:disable force_unwrapping
// swiftlint:disable force_try

import Foundation
@testable import HackRxNews

final class NetworkServiceMock: NetworkService {

    let bundle: Bundle

    var json: URL?

    enum State {
        case `default`
        case failure
        case unexpectedResponseType
        case missingData
    }

    var state: NetworkServiceMock.State = .default

    var statusCode: Int = 200

    init(bundle: Bundle) {
        self.bundle = bundle
    }

    func dataTask(with: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        switch state {
        case .default:
            let response = HTTPURLResponse(url: with.url!, statusCode: statusCode, httpVersion: nil, headerFields: nil)
            let data = try! Data(contentsOf: json!)
            completionHandler(data, response, nil)
            return NetworkServiceDataTaskMock()
        case .failure:
            completionHandler(nil, nil, NetworkServiceError.requestFailed)
            return NetworkServiceDataTaskMock()
        case .unexpectedResponseType:
            let response = URLResponse()
            completionHandler(nil, response, NetworkServiceError.unexpectedResponseType)
            return NetworkServiceDataTaskMock()
        case .missingData:
            let response = HTTPURLResponse(url: with.url!, statusCode: statusCode, httpVersion: nil, headerFields: nil)
            completionHandler(nil, response, nil)
            return NetworkServiceDataTaskMock()
        }
    }
}
