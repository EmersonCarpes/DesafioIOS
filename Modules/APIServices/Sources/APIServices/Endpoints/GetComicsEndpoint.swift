//
//  GetComicsEndpoint.swift
//  
//
//  Created by Emerson Carpes on 13/11/22.
//

import Foundation

struct GetComicsEndpoint: HTTPClientEndpoint {
    var method: HTTPMethod
    var path: String
    var parameters: [String : Any]?
    
    // MARK: Response
    
    struct Response: Decodable {
        let data: ComicsResponseData
    }
}
