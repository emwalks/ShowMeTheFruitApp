//
//  FruitListPresenter.swift
//  ShowMeTheFruitApp
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 07/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

class FruitListPresenter: FruitListPresenterProtocol {
    private weak var fruitListViewDelegate: FruitListViewDelegate?
    private let fruitDataService: FruitDataService
    
    required init(fruitListViewDelegate: FruitListViewDelegate?, fruitDataService: FruitDataService) {
        self.fruitDataService = fruitDataService
        self.fruitListViewDelegate = fruitListViewDelegate
        showFruitList()
    }
    
    
    func showFruitList() {
        let arrayOfFruitItems = fruitDataService.getFruit()
        var arrayOfFruitTypes: Array<String?> = []
        arrayOfFruitItems.forEach {
            arrayOfFruitTypes.append($0?.fruitType)
        }
        self.fruitListViewDelegate?.setFruit(arrayOfFruitTypes: arrayOfFruitTypes)
    }
    
}
