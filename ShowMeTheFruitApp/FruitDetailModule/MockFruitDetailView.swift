//
//  MockFruitDetailView.swift
//  ShowMeTheFruitApp
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 09/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

class MockFruitDetailView: FruitDetailViewDelegateProtocol {
     
     var fruitDetailPresenter : FruitDetailPresenter!
     var fruitSelected: FruitItem? = nil
     
     var fruitPriceLabel: Double = -1
     var fruitWeightLabel: Double = -1
     
     func setFruitDetail(fruitSelected: FruitItem?) {
         self.fruitSelected = fruitSelected
         self.fruitPriceLabel = fruitSelected!.priceInPounds
         self.fruitWeightLabel = fruitSelected!.weightInKilos
     }
 }
