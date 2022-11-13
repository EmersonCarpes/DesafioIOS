//
//  HTTPClientServiceProtocol.swift
//  
//
//  Created by Emerson Carpes on 13/11/22.
//

import Foundation

protocol HTTPClientService {
    var rootURLPath: String { get }
    var parameters: [String: String] { get set }

    func request(endpoint: HTTPClientEndpoint, completion: @escaping (HTTPClientResponse) -> Void)
}

extension HTTPClientService {
    
    func request(endpoint: HTTPClientEndpoint, completion: @escaping (HTTPClientResponse) -> Void) {

        var builder = URLRequestBuilder(method: endpoint.method,
                                        urlPath: self.rootURLPath + endpoint.path,
                                        parameters: self.parameters)

        let urlRequest = try! builder.urlRequest()
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.fail(error))
                return
            }
            
            if let data = data {
                completion(.success(HTTPClientResponseData(value: data, response: response, request: urlRequest)))
                return
            }
        }
        task.resume()
    }
}


