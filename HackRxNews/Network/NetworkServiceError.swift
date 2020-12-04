//
//  NetworkServiceError.swift
//  HackRxNews
//
//  Created by Artur Carneiro on 04/12/20.
//

import Foundation

/// List of possible errors resulting from interactions with
/// `NetworkService`.
enum NetworkServiceError: Error {
    /// The request has failed, either due to lack of connectivity or invalid `URLRequest`.
    case requestFailed
    /// Received an unexpected response type. Expected response type: `HTTPURLResponse`.
    case unexpectedResponseType
    /// Received an unexpected HTTP status code. Expected status codes: `200...299`.
    case unexpectedHTTPStatusCode
    /// Could not safely unwrap data from request.
    case missingData
    /// Failure at the decoding step. Check if your type is correctly `Decodable`.
    case decodingFailed
}

extension NetworkServiceError {
    var description: String {
        switch self {
        case .requestFailed:
            return "Request failed."
        case .unexpectedResponseType:
            return "Received unexpected response type. Expected HTTP."
        case .unexpectedHTTPStatusCode:
            return "Received unexpected HTTP status code."
        case .missingData:
            return "Missing data from response."
        case .decodingFailed:
            return "Decoding failed."
        }
    }
}
