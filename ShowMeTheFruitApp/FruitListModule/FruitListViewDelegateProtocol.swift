//
//  FruitListViewDelegateProtocol.swift
//  ShowMeTheFruitApp
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 07/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

protocol FruitListViewDelegateProtocol: class {
    var fruitListPresenter: FruitListPresenterProtocol? { get set }
    func setFruit(arrayOfFruitTypes: Array<String?>)
}
