//
//  Endpoint.swift
//  HackRxNews
//
//  Created by Artur Carneiro on 06/12/20.
//

import Foundation

/// Endpoints available.
enum Endpoint {
    // MARK: - Cases
    /// Endpoint for `Top Stories`.
    case topStories

    /// Endpoint of an `Item` from an `StoryID.
    case item(ItemID)
}

// MARK: - Extension
extension Endpoint {
    /// The Endpoint's version.
    private var version: String {
        return "v0"
    }

    /// The Endpoints' scheme.
    private var scheme: String {
        return "https"
    }

    /// The Endpoints' host.
    private var host: String {
        return "hacker-news.firebaseio.com"
    }

    /// The URL for a given Endpoint.
    var url: URL? {
        switch self {
        case .topStories:
            var urlComponents = URLComponents()
            urlComponents.scheme = scheme
            urlComponents.host = host
            urlComponents.path = "/\(version)/topstories.json"

            guard let url = urlComponents.url else {
                return nil
            }

            return url

        case .item(let itemID):
            var urlComponents = URLComponents()
            urlComponents.scheme = scheme
            urlComponents.host = host
            urlComponents.path = "/\(version)/item/\(itemID).json"

            guard let url = urlComponents.url else {
                return nil
            }

            return url
        }
    }
}
