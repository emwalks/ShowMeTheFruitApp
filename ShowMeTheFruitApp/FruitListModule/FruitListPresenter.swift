//
//  FruitListPresenter.swift
//  ShowMeTheFruitApp
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 07/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation


class FruitListPresenter: FruitListPresenterProtocol {
    private weak var fruitListViewDelegate: FruitListViewDelegateProtocol?
    private let fruitDataService: FruitDataServiceProtocol
    
    required init(fruitListViewDelegate: FruitListViewDelegateProtocol?, fruitDataService: FruitDataServiceProtocol) {
        self.fruitDataService = fruitDataService
        self.fruitListViewDelegate = fruitListViewDelegate
        showFruitList()
    }
    
    
    func showFruitList() {
        fruitDataService.getFruits { [weak self] fruits in
            
            var arrayOfFruitTypes: Array<String?> = []
            fruits.forEach {
                arrayOfFruitTypes.append($0?.type)
            }
            print("showFruitList function has been called from getFruits")
            self?.fruitListViewDelegate?.setFruit(arrayOfFruitTypes: arrayOfFruitTypes)
        }
        
    }
    
}
