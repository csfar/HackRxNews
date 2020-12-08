//
//  NetworkManager.swift
//  HackRxNews
//
//  Created by Artur Carneiro on 04/12/20.
//

import RxSwift

/// Object responsible for managing network requests.
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
    /// - Returns: An `Observable` of type `T`.
    func perform<T: Decodable>(_ request: URLRequest, for type: T.Type) -> Observable<T> {
        return Observable.create { [weak self] observer in
            let serviceTask = self?.service.dataTask(with: request, completionHandler: { (data, response, error) in
                if error != nil && response == nil {
                    observer.onError(NetworkServiceError.requestFailed)
                }

                if let httpResponse = response as? HTTPURLResponse {
                    guard 200...299 ~= httpResponse.statusCode else {
                        observer.onError(NetworkServiceError.unexpectedHTTPStatusCode)
                        return
                    }

                    guard let unwrappedData = data else {
                        observer.onError(NetworkServiceError.missingData)
                        return
                    }

                    do {
                        let decoded = try JSONDecoder().decode(T.self, from: unwrappedData)
                        observer.onNext(decoded)
                    } catch {
                        observer.onError(NetworkServiceError.decodingFailed)
                    }

                } else {
                    observer.onError(NetworkServiceError.unexpectedResponseType)
                }
                
                observer.onCompleted()
            })
            serviceTask?.resume()
            
            return Disposables.create {
                serviceTask?.cancel()
            }
        }
    }
}
