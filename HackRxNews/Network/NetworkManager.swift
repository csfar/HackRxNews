//
//  NetworkManager.swift
//  HackRxNews
//
//  Created by Artur Carneiro on 04/12/20.
//

import RxSwift

/// Responsible for managing network requests.
/// Stubbing `NetworkService` is suggested when testing.
final class NetworkManager {

    //- MARK: Properties
    /// The service responsible for performing the requests.
    private let service: NetworkService

    //- MARK: Init
    /// Initializes a new instance of this type.
    /// - Parameter service: The service responsible for performing the requests.
    init(service: NetworkService = URLSession.shared) {
        self.service = service
    }
    //- MARK: API
    /// Performs a request using the `service` provided to the `NetworkManager`.
    /// - Parameter request: The `URLRequest` used in the request.
    /// - Parameter for: The type of `T`.
    /// - Returns: An `Observable` of type `T`.
    func perform<T: Decodable>(_ request: URLRequest, for type: T.Type) -> Observable<T> {
        return Observable.create { [weak self] observable in
            let serviceTask = self?.service.dataTask(with: request, completionHandler: { (data, response, error) in
                if error != nil && response == nil {
                    observable.onError(NetworkServiceError.requestFailed)
                }

                if let httpResponse = response as? HTTPURLResponse {
                    guard 200...299 ~= httpResponse.statusCode else {
                        observable.onError(NetworkServiceError.unexpectedHTTPStatusCode)
                        return
                    }

                    guard let unwrappedData = data else {
                        observable.onError(NetworkServiceError.missingData)
                        return
                    }

                    do {
                        let decoded = try JSONDecoder().decode(T.self, from: unwrappedData)
                        observable.onNext(decoded)
                        observable.onCompleted()
                    } catch {
                        observable.onError(NetworkServiceError.decodingFailed)
                    }

                } else {
                    observable.onError(NetworkServiceError.unexpectedResponseType)
                }
            })
            serviceTask?.resume()
            
            return Disposables.create {
                serviceTask?.cancel()
            }
        }
    }
}
