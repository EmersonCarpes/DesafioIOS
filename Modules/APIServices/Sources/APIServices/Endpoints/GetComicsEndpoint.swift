//
//  GetComicsEndpoint.swift
//  
//
//  Created by Emerson Carpes on 13/11/22.
//

import Foundation

struct GetComicsEndpoint: HTTPClientEndpoint {
    var method: HTTPMethod = .get
    var path: String = "public/comics"
    var parameters: [String : Any]?
    
    struct QueryItems: HTTPClientParameter {
        let offset: Int
        let titleStartsWith: String?
    }
}
