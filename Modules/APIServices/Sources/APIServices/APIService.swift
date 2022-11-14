//
//  APIService.swift
//
//
//  Created by Emerson Carpes on 13/11/22.
//

import Foundation

public protocol APIServiceProtocol {
    static var repository: APIServiceRepositories { get }
}

public struct APIService: APIServiceProtocol {
    public static var repository: APIServiceRepositories {
        return APIServiceRepositoriesImpl.shared
    }
}
