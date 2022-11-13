//
//  ApplicationCoordinator.swift
//  DesafioIOS
//
//  Created by Emerson Carpes on 13/11/22.
//

import UIKit

final class ApplicationCoordinator: Coordinator {
    let window: UIWindow
    var navigationController: UINavigationController
    var childCoordinator: Coordinator

    init(window: UIWindow) {
        self.window = window
        navigationController = UINavigationController()
        childCoordinator = MoviesListCoordinator(with: navigationController)
    }

    func start() {
        window.rootViewController = navigationController
        childCoordinator.start()
        window.makeKeyAndVisible()
    }
}
