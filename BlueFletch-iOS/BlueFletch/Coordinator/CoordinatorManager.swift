//
//  CoordinatorManager.swift
//  BlueFletch
//
//  Created by Jason Kim on 6/24/20.
//  Copyright © 2020 Jason Kim. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject { }

class CoordinatorManager {
    weak var fromController: UIViewController?
    weak var navigationController: UINavigationController?
    
    init(fromController: UIViewController? = nil, navigationController: UINavigationController? = nil) {
        self.fromController = fromController
        self.navigationController = navigationController
    }
    
    fileprivate func present(presentViewController: UIViewController, animated: Bool = true) {
        fromController?.present(presentViewController, animated: animated, completion: nil)
    }
    
    fileprivate func push(pushViewController: UIViewController, animated: Bool = true) {
        navigationController?.pushViewController(pushViewController, animated: animated)
    }
}

extension CoordinatorManager: WindowCoordinator {
    func buildHomeController() -> UINavigationController {
        let networkingService = NetworkingService()
        let offeringViewModel = OfferingViewModel(networkingService: networkingService)
        let homeController = HomeController(networkingService: networkingService, offeringViewModel: offeringViewModel, collectionViewLayout: UICollectionViewFlowLayout())
        let navigationController = UINavigationController(rootViewController: homeController)
        navigationController.navigationBar.prefersLargeTitles = true
        return navigationController
    }
}

extension CoordinatorManager: HomeCoordinator {
    func pushContactController() {
        let contactController = ContactController()
        self.push(pushViewController: contactController)
    }
}
