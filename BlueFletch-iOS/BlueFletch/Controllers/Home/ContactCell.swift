//
//  ContactCell.swift
//  BlueFletch
//
//  Created by Jason Kim on 6/24/20.
//  Copyright © 2020 Jason Kim. All rights reserved.
//

import UIKit

class ContactCell: UICollectionViewCell {
    
    public var handleContact: (() -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var contactImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "BlueFletch_Contact").withRenderingMode(.alwaysOriginal)
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var contactShortDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Ready to take the next step?"
        label.numberOfLines = 2
        label.font = FontHelper.setFont(.medium, size: 16, font: .typewriter)
        label.textAlignment = .center
        label.textColor = UIColor.blueFletchBlack()
        return label
    }()
    
    private lazy var contactButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("CONTACT US", for: .normal)
        button.setTitleColor(UIColor.blueFletchWhite(), for: .normal)
        button.titleLabel?.font = FontHelper.setFont(.medium, size: 12, font: .typewriter)
        button.backgroundColor = UIColor.blueFletchBlue()
        
        button.addTarget(self, action: #selector(handleContactButton(_:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func handleContactButton(_ button: UIButton) {
        button.isUserInteractionEnabled = false
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
            button.isUserInteractionEnabled = true
        }
        
        handleContact?()
    }
    
    private func setupCell() {
        
        backgroundColor = UIColor.blueFletchWhite()
        addSubview(contactImageView)
        contactImageView.anchorSimple(centerX: centerXAnchor, centerY: nil, top: topAnchor, leading: nil, bottom: nil, trailing: nil, paddingTop: 30, paddingLeading: 0, paddingBottom: 0, paddingTrailing: 0, width: 60, height: 60)
        
        addSubview(contactShortDescriptionLabel)
        contactShortDescriptionLabel.anchorSimple(centerX: nil, centerY: nil, top: contactImageView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, paddingTop: 10, paddingLeading: 24, paddingBottom: 0, paddingTrailing: 24, width: 0, height: 20)
        
        addSubview(contactButton)
        contactButton.anchorSimple(centerX: nil, centerY: nil, top: contactShortDescriptionLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, paddingTop: 12, paddingLeading: 75, paddingBottom: 0, paddingTrailing: 75, width: 0, height: 35)
    }
    
}
