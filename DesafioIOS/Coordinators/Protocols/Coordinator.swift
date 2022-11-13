//
//  Coordinator.swift
//  DesafioIOS
//
//  Created by Emerson Carpes on 13/11/22.
//

import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    func start()
}
