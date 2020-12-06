//
//  NetworkServiceDataTaskMock.swift
//  HackRxNewsTests
//
//  Created by Artur Carneiro on 06/12/20.
//

import Foundation

final class NetworkServiceDataTaskMock: URLSessionDataTask {
    private let mock: String

    init(mock: String = "") {
        self.mock = mock
    }

    override func resume() {
        return
    }
}
