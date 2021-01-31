//
//  NetworkService.swift
//  HackRxNews
//
//  Created by Artur Carneiro on 04/12/20.
//

import Foundation

/// A service responsible for performing network requests.
protocol NetworkService {
    func dataTask(with: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}
