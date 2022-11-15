//
//  MoviesListCoordinator.swift
//  DesafioIOS
//
//  Created by Emerson Carpes on 13/11/22.
//

import UIKit

final class MoviesListCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = MoviesListViewController(coordinator: self, viewModel: MoviesListViewModel())
        navigationController.pushViewController(viewController, animated: true)
    }

    // MARK: Actions
    
    func didSelect(_ movie: Movie) {
        let movieDetails = MovieDetailsCoordinator(with: navigationController)
        movieDetails.start(movie: movie)
    }
}
