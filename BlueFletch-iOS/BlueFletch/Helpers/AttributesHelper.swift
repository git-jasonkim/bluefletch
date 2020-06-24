//
//  AttributesHelper.swift
//  BlueFletch
//
//  Created by Jason Kim on 6/24/20.
//  Copyright © 2020 Jason Kim. All rights reserved.
//

import UIKit

class AttributesHelper {
    static let navTitleAttribute: [NSAttributedString.Key : Any] = [NSAttributedString.Key.foregroundColor: UIColor.blueFletchWhite(), NSAttributedString.Key.font: FontHelper.setFont(.medium, size: 17, font: .avenir)]
    static let navLargeTitleAttribute: [NSAttributedString.Key : Any] = [NSAttributedString.Key.foregroundColor: UIColor.blueFletchWhite(), NSAttributedString.Key.font: FontHelper.setFont(.medium, size: 34, font: .avenir)]
}
