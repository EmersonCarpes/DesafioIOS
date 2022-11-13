//
//  DataResponse.swift
//  
//
//  Created by Emerson Carpes on 13/11/22.
//

import Foundation

public enum DataResponse<T: Decodable> {
    case success(T)
    case fail(Error)
}
