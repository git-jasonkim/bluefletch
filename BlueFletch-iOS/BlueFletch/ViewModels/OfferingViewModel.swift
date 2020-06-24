//
//  OfferingViewModel.swift
//  BlueFletch
//
//  Created by Jason Kim on 6/24/20.
//  Copyright © 2020 Jason Kim. All rights reserved.
//

import Foundation

class OfferingViewModel {
    
    private var networkingService: HomeApi
    
    init(networkingService: HomeApi) {
        self.networkingService = networkingService
    }
    
    public var offeringCount: Int {
        return offerings.count
    }
    
    private var offerings = [OfferingModel]()
    
    public var reloadData: (() -> ())?
    
    public func viewDidLoad() {
        loadData()
    }
    
    func getImageName(of index: Int) -> String {
        return offerings[index].imageName ?? "BlueFletch_LegacyMigration"
    }
    
    func getShortDescription(of index: Int) -> String {
        return offerings[index].shortDescription ?? "Sorry! Working on it!"
    }
    
    func getDetailedDescription(of index: Int) -> String {
        return offerings[index].detailedDescription ?? "Sorry! Working on it!"
    }
    
    private func loadData() {
        networkingService.fetchOffering { (result) in
            switch result {
            case .success(let offerings):
                DispatchQueue.main.async {
                    self.offerings = offerings
                    self.reloadData?()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
