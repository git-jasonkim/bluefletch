//
//  ContactController.swift
//  BlueFletch
//
//  Created by Jason Kim on 6/24/20.
//  Copyright © 2020 Jason Kim. All rights reserved.
//

import UIKit

class ContactController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blueFletchBlue()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        let statusBarView = UIView(frame: view.window?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect(x: 0, y: 0, width: view.frame.width, height: 20))
        statusBarView.backgroundColor = UIColor.blueFletchBlue()
        view.addSubview(statusBarView)
        
        self.title = "Contact Blue Fletch"
        self.navigationController?.navigationBar.titleTextAttributes = AttributesHelper.navTitleAttribute
        self.navigationController?.navigationBar.largeTitleTextAttributes = AttributesHelper.navLargeTitleAttribute
        self.navigationController?.navigationBar.backgroundColor = UIColor.blueFletchBlue()
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
}
