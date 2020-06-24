//
//  HomeController.swift
//  BlueFletch
//
//  Created by Jason Kim on 6/24/20.
//  Copyright © 2020 Jason Kim. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController {
    
    private var cHomeHeaderCellId = "cHomeHeaderCellId"
    private var cOfferingCellId = "cOfferingCellId"
    private var cContactCellId = "cContactCellId"
    
    private var networkingService: NetworkingService
    private var offeringViewModel: OfferingViewModel
    private var coordinator: HomeCoordinator!
    
    init(networkingService: NetworkingService, offeringViewModel: OfferingViewModel, collectionViewLayout: UICollectionViewLayout) {
        self.networkingService = networkingService
        self.offeringViewModel = offeringViewModel
        super.init(collectionViewLayout: collectionViewLayout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupController()
        setupOfferingViewModel()
    }
    
    private func setupOfferingViewModel() {
        offeringViewModel.reloadData = { [weak self] in
            self?.collectionView.reloadData()
            self?.collectionView.refreshControl?.endRefreshing()
        }
        offeringViewModel.viewDidLoad()
    }
    
    private func setupNavigationBar() {
        self.coordinator = CoordinatorManager(fromController: self, navigationController: self.navigationController)

        let statusBarView = UIView(frame: view.window?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect(x: 0, y: 0, width: collectionView.frame.width, height: 20))
        statusBarView.backgroundColor = UIColor.blueFletchBlue()
        view.addSubview(statusBarView)
        
        self.title = "BlueFletch"
        self.navigationController?.navigationBar.titleTextAttributes = AttributesHelper.navTitleAttribute
        self.navigationController?.navigationBar.largeTitleTextAttributes = AttributesHelper.navLargeTitleAttribute
        self.navigationController?.navigationBar.backgroundColor = UIColor.blueFletchBlue()
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    }
    
    private func setupController() {
        collectionView.backgroundColor = UIColor.blueFletchWhite()
        collectionView.register(HomeHeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: cHomeHeaderCellId)
        collectionView.register(OfferingCell.self, forCellWithReuseIdentifier: cOfferingCellId)
        collectionView.register(ContactCell.self, forCellWithReuseIdentifier: cContactCellId)
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 2
            layout.minimumInteritemSpacing = 0
        }
        
        collectionView.showsVerticalScrollIndicator = true
        collectionView.alwaysBounceVertical = true
        
        let refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        collectionView.refreshControl = refresher
    }
    
        
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return offeringViewModel.offeringCount + 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: cHomeHeaderCellId, for: indexPath) as! HomeHeaderCell
            return headerCell
        default: return UICollectionReusableView()
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item < offeringViewModel.offeringCount {
            let offeringCell = collectionView.dequeueReusableCell(withReuseIdentifier: cOfferingCellId, for: indexPath) as! OfferingCell
            offeringCell.setImage(imageName: offeringViewModel.getImageName(of: indexPath.item))
            offeringCell.setShortDescription(shortText: offeringViewModel.getShortDescription(of: indexPath.item))
            offeringCell.setDetailedDescription(detailedText: offeringViewModel.getDetailedDescription(of: indexPath.item))
            return offeringCell
        }
        
        let contactCell = collectionView.dequeueReusableCell(withReuseIdentifier: cContactCellId, for: indexPath) as! ContactCell
        contactCell.handleContact = handleContact
        return contactCell

    }

}

extension HomeController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: collectionView.frame.width, height: collectionView.frame.height / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width, height: 205)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 20, left: 0, bottom: 0, right: 0)
    }
}

extension HomeController {
    private func handleContact() {
        coordinator.pushContactController()
    }
    
    @objc private func handleRefresh() {
        offeringViewModel.viewDidLoad()
    }
}
