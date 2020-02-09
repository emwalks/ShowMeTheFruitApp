//
//  MockFruitDataService.swift
//  ShowMeTheFruitApp
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 07/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

class MockFruitDataService: FruitDataServiceProtocol {
    
    func getFruit() -> Array<FruitItem?> {
        let arrayOfFruitItems = [
            FruitItem(type: "mockApple", price: 149, weight: 120),
            FruitItem(type: "mockBanana", price: 129, weight: 80)
        ]
        return arrayOfFruitItems
    }
    
    func getFruitDetail(type:(String), callBack:(FruitItem?) -> Void) {
        let arrayOfFruitItems = [
            FruitItem(type: "mockApple", price: 149, weight: 120),
            FruitItem(type: "mockBanana", price: 129, weight: 80)
        ]
        
        if let foundFruitType = arrayOfFruitItems.first(where: {$0.type == type}) {
            callBack(foundFruitType)
        } else {
            callBack(nil)
        }
    }
}
