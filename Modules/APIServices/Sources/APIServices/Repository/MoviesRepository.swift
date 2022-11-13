//
//  MoviesRepository.swift
//  
//
//  Created by Emerson Carpes on 13/11/22.
//

import Foundation

public protocol MoviesRepository {
    func getComics(_ completion: @escaping (DataResponse<ComicsResponse>) -> Void)
}

// MARK: - Implementation

final class MoviesRepositoryImpl: MoviesRepository {
    func getComics(_ completion: @escaping (DataResponse<ComicsResponse>) -> Void) {
        let endpoint = GetComicsEndpoint(method: .get, path: "public/comics")
        
        MobileV1Service.shared.request(endpoint: endpoint) { response in
            switch response {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode(ComicsResponse.self, from: data.value)
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
