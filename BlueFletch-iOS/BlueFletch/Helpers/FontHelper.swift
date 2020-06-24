//
//  FontHelper.swift
//  BlueFletch
//
//  Created by Jason Kim on 6/24/20.
//  Copyright © 2020 Jason Kim. All rights reserved.
//

import UIKit

enum Font {
    case avenir, typewriter
}

enum FontWeight {
    case regular, medium, bold
}

class FontHelper {
    static func setFont(_ weight: FontWeight, size: CGFloat, font: Font) -> UIFont {
        var requestedFont = UIFont()
        
        switch font {
        case .avenir:
            switch weight {
            case .regular:
                requestedFont = UIFont(name: "Avenir-Book", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
            case .medium:
                requestedFont = UIFont(name: "Avenir-Medium", size: size) ?? UIFont.systemFont(ofSize: size, weight: .medium)
            case .bold:
                requestedFont = UIFont(name: "Avenir-Heavy", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
            }
            return requestedFont
        
        case .typewriter:
            switch weight {
            case .regular:
                requestedFont = UIFont(name: "AmericanTypewriter", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
            case .medium:
                requestedFont = UIFont(name: "AmericanTypewriter-Semibold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .medium)
            case .bold:
                requestedFont = UIFont(name: "AmericanTypewriter-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
            }
            return requestedFont
        }
    }
}
