//
//  HTTPClientResponse.swift
//  
//
//  Created by Emerson Carpes on 13/11/22.
//

import Foundation

struct HTTPClientResponseData {
    var value: Data
    var response: URLResponse?
    var request: URLRequest?
}

enum HTTPClientResponse {
    case success(HTTPClientResponseData)
    case fail(Error)
}
