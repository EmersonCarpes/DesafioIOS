//
//  MovieDetailsCoordinator.swift
//  DesafioIOS
//
//  Created by Emerson Carpes on 13/11/22.
//

import UIKit
import APIServices

final class MovieDetailsCoordinator: Coordinator {
    var navigationController: UINavigationController

    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() { }
    
    func start(movie: Movie) {
        let viewController = MovieDetailsViewController(coordinator: self,
                                                        viewModel: MovieDetailsViewModel(movie: movie))
        navigationController.pushViewController(viewController, animated: true)
    }
}
