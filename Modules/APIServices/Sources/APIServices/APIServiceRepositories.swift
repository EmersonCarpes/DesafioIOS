//
//  APIServiceRepositories.swift
//  
//
//  Created by Emerson Carpes on 13/11/22.
//

import Foundation

public protocol APIServiceRepositories {
    var movies: MoviesRepository { get }
}

final class APIServiceRepositoriesImpl: APIServiceRepositories {

    static var shared = APIServiceRepositoriesImpl()
    
    public var movies: MoviesRepository { return MoviesRepositoryImpl() }
}
