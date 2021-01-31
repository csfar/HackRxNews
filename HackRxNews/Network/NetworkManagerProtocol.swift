//
//  NetworkManagerProtocol.swift
//  HackRxNews
//
//  Created by Artur Carneiro on 31/01/21.
//

import RxSwift

/// A manager responsible for managing network requests
protocol NetworkManagerProtocol {
    func perform<T: Decodable>(_ request: URLRequest, for type: T.Type) -> Observable<T>
}
