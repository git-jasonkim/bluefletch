//
//  WindowCoordinator.swift
//  BlueFletch
//
//  Created by Jason Kim on 6/24/20.
//  Copyright © 2020 Jason Kim. All rights reserved.
//

import UIKit

protocol WindowCoordinator: Coordinator {
    func buildHomeController() -> UINavigationController
}
