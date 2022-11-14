//
//  MoviesListViewModel.swift
//  DesafioIOS
//
//  Created by Emerson Carpes on 13/11/22.
//

import APIServices

final class MoviesListViewModel {
    
    var onUpdateUI: (() -> ())?
    
    var movies: [Movie] = []
    
    func fetchComics() {
        APIService.repository.movies.getComics { [weak self] response in
            switch response {
            case .success(let value):
                self?.movies = value.data.results
                self?.onUpdateUI?()
            case .fail(_):
                break
            }
        }
    }
    
}
