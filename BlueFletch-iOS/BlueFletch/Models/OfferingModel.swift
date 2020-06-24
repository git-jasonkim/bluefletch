//
//  OfferingModel.swift
//  BlueFletch
//
//  Created by Jason Kim on 6/24/20.
//  Copyright © 2020 Jason Kim. All rights reserved.
//

import UIKit

struct OfferingModel: Decodable {
    
    var imageName: String?
    var shortDescription: String?
    var detailedDescription: String?
    
    init(attributes: [String: Any]) {
        self.imageName = attributes["imageName"] as? String
        self.shortDescription = attributes["shortName"] as? String
        self.detailedDescription = attributes["detailedDescription"] as? String
    }
    
    init(imageName: String, shortDescription: String, detailedDescription: String) {
        self.imageName = imageName
        self.shortDescription = shortDescription
        self.detailedDescription = detailedDescription
    }
}
