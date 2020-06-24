//
//  OfferingCell.swift
//  BlueFletch
//
//  Created by Jason Kim on 6/24/20.
//  Copyright © 2020 Jason Kim. All rights reserved.
//

import UIKit

class OfferingCell: UICollectionViewCell {
    
    public func setImage(imageName: String) {
        offerImageView.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
    }
    
    public func setShortDescription(shortText: String) {
        offerShortDescriptionLabel.text = shortText
    }
    
    public func setDetailedDescription(detailedText: String) {
        offerDetailedDescriptionLabel.text = detailedText
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        offerImageView.image = nil
        offerShortDescriptionLabel.text = nil
        offerDetailedDescriptionLabel.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var offerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var offerShortDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = FontHelper.setFont(.medium, size: 16, font: .typewriter)
        label.textAlignment = .center
        label.textColor = UIColor.blueFletchBlack()
        return label
    }()
    
    private lazy var offerDetailedDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = FontHelper.setFont(.regular, size: 12, font: .typewriter)
        label.textAlignment = .center
        label.textColor = UIColor.blueFletchBlack()
        return label
    }()
    
    private func setupCell() {
        backgroundColor = UIColor.blueFletchWhite()
        addSubview(offerImageView)
        offerImageView.anchorSimple(centerX: centerXAnchor, centerY: nil, top: topAnchor, leading: nil, bottom: nil, trailing: nil, paddingTop: 30, paddingLeading: 0, paddingBottom: 0, paddingTrailing: 0, width: 75, height: 75)
        
        addSubview(offerShortDescriptionLabel)
        offerShortDescriptionLabel.anchorSimple(centerX: nil, centerY: nil, top: offerImageView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, paddingTop: 10, paddingLeading: 24, paddingBottom: 0, paddingTrailing: 24, width: 0, height: 20)
        
        addSubview(offerDetailedDescriptionLabel)
        offerDetailedDescriptionLabel.anchorSimple(centerX: nil, centerY: nil, top: offerShortDescriptionLabel.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, paddingTop: 12, paddingLeading: 36, paddingBottom: 0, paddingTrailing: 36, width: 0, height: 0)
    }
    
}
