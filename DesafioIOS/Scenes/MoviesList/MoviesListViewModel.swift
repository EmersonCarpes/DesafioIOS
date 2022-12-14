//
//  MoviesListViewModel.swift
//  DesafioIOS
//
//  Created by Emerson Carpes on 13/11/22.
//

import APIServices

final class MoviesListViewModel {
    
    private var pagination = false
    
    var onUpdateUI: (() -> ())?
    var movies: [Movie] = []
    var offset = 0
    
    func fetchComics(offset: Int) {
        APIService.repository.movies.getComics(offset: offset, filterFor: nil) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let value):
                let movies = MovieTransformer.movies(value.data.results)
                self.movies.append(contentsOf: movies)
                self.offset = value.data.offset + 48
                self.pagination = true
                self.onUpdateUI?()
            case .fail(_):
                break
            }
        }
    }
    
    func shouldGetNextPage(row: Int) -> Bool {
        guard row == (movies.count - 18) && pagination else {
            return false
        }
        pagination = false
        
        return true
    }
}
