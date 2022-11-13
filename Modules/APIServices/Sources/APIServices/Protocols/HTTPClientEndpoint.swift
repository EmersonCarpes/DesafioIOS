//
//  HTTPClientEndpoint.swift
//  
//
//  Created by Emerson Carpes on 13/11/22.
//

import Foundation

protocol HTTPClientEndpoint {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: [String: Any]? { get set }
}
