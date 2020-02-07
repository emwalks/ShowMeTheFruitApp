//
//  MockFruitListView.swift
//  ShowMeTheFruitApp
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 07/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

class MockFruitListView: FruitListViewDelegate {
    
    var fruitListPresenter: FruitListPresenter!
    fileprivate var arrayOfFruitTypes: Array<String?> = []
    
    var fruitTypeLabelForIndex1: String = ""
    var fruitTypeLabelForIndex2: String = ""
    var fruitTypeLabelForIndex3: String = ""
    
    func setFruit(arrayOfFruitTypes: Array<String?>) {
        self.arrayOfFruitTypes = arrayOfFruitTypes
        if arrayOfFruitTypes.count != 0 {
            fruitTypeLabelForIndex1 = arrayOfFruitTypes[0] ?? ""
            fruitTypeLabelForIndex2 = arrayOfFruitTypes[1] ?? ""
            fruitTypeLabelForIndex3 = ""
        } else {
            fruitTypeLabelForIndex1 =  ""
            fruitTypeLabelForIndex2 =  ""
            fruitTypeLabelForIndex3 =  ""
        }
        
    }
}
