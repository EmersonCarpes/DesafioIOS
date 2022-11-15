//
//  MoviesRepository.swift
//  
//
//  Created by Emerson Carpes on 13/11/22.
//

import Foundation

public protocol MoviesRepository {
    func getComics(offset: Int, filterFor: String?, _ completion: @escaping (DataResponse<ComicsResponseJSON>) -> Void)
}

// MARK: - Implementation

final class MoviesRepositoryImpl: MoviesRepository {
    func getComics(offset: Int, filterFor: String? = nil, _ completion: @escaping (DataResponse<ComicsResponseJSON>) -> Void) {
        
        let queryItems = GetComicsEndpoint.QueryItems(offset: offset, titleStartsWith: filterFor)
        let endpoint = GetComicsEndpoint(parameters: queryItems.asUnsafeDictionary())
        
        MobileV1Service.shared.request(endpoint: endpoint) { response in
            switch response {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode(ComicsResponseJSON.self, from: data.value)
                    completion(.success(decodedData))
                } catch let error {
                    completion(.fail(error))
                }
            case .fail(let error):
                completion(.fail(error))
            }
        }
    }
}
