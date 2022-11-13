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
        let viewController = MoviesListViewController()
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }

}
