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
    
    var listOfFruits = [FruitItem]()
    
    func showFruitList() {
        let arrayOfFruitItems = fruitDataService.getFruit()
        var arrayOfFruitTypes: Array<String?> = []
        arrayOfFruitItems.forEach {
            arrayOfFruitTypes.append($0?.type)
        }
        self.fruitListViewDelegate?.setFruit(arrayOfFruitTypes: arrayOfFruitTypes)
        
        FruitDataService.shared.fetchFruitsFromURL { [weak self] (result) in
            switch result {
            case .failure(_):
                self?.listOfFruits = []
            case .success(let fruits):
                self?.listOfFruits = fruits
                var arrayOfFruitTypes: Array<String?> = []
                self?.listOfFruits.forEach {
                    arrayOfFruitTypes.append($0.type)
                }
                print("showFruitList function has been called")
                self?.fruitListViewDelegate?.setFruit(arrayOfFruitTypes: arrayOfFruitTypes)
                
            }
        }
        
    }
    
}
