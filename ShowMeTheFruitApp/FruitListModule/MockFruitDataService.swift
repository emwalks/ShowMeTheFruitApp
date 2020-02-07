//
//  MockFruitDataService.swift
//  ShowMeTheFruitApp
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 07/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

class MockFruitDataService: FruitDataService {
    
    func getFruit() -> Array<FruitItem?> {
        let arrayOfFruitItems = [
            FruitItem(fruitType: "mockApple", fruitPriceInPence: 149, fruitWeightInGrams: 120),
            FruitItem(fruitType: "mockBanana", fruitPriceInPence: 129, fruitWeightInGrams: 80)
        ]
        return arrayOfFruitItems
    }
}
