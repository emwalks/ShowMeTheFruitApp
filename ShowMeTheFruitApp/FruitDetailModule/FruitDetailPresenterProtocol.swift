//
//  FruitDetailPresenterProtocol.swift
//  ShowMeTheFruitApp
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 09/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

protocol FruitDetailPresenterProtocol {
    
    init(fruitDetailViewDelegate: FruitDetailViewDelegateProtocol?, fruitDataService: FruitDataServiceProtocol)
    
    func showFruitDetail(type: String)
}
 
