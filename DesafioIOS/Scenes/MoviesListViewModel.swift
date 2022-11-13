//
//  MoviesListViewModel.swift
//  DesafioIOS
//
//  Created by Emerson Carpes on 13/11/22.
//

import APIServices

final class MoviesListViewModel {
    func fetchComics() {
        APIService.repository.movies.getComics { response in
            switch response {
            case .success(let value):
                break
            case .fail(let error):
                break
            }
        }
    }
    
}
