//
//  URLRequestBuilder.swift
//  
//
//  Created by Emerson Carpes on 13/11/22.
//

import Foundation

struct URLRequestBuilder {
    var method: HTTPMethod
    var urlPath: String
    var parameters: [String: Any]?
    
    mutating func urlRequest() throws -> URLRequest {
        
        guard var url = URL(string: urlPath) else {
            throw URLRequestBuilderError.invalidURLPath(urlPath)
        }

        var queryItems = [URLQueryItem]()
        if let parameters = parameters {
            for (key, value) in parameters {
                
                queryItems.append(URLQueryItem(name: key, value: "\(value)"))
            }
        }
        url.append(queryItems: queryItems)
        
        let urlRequest = URLRequest(url: url)
        
        return urlRequest
    }
}

// MARK: - Errors

enum URLRequestBuilderError: Error {
    case invalidURLPath(String)
}
