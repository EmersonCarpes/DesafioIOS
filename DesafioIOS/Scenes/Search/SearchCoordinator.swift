//
//  SearchCoordinator.swift
//  DesafioIOS
//
//  Created by Emerson Carpes on 15/11/22.
//

import UIKit

final class SearchCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() { }

    // MARK: Actions
    
    func didSelect(_ movie: Movie) {
        let movieDetails = MovieDetailsCoordinator(with: navigationController)
        movieDetails.start(movie: movie)
    }
}
