//
//  MockScreenNavController.swift
//  ShowMeTheFruitApp
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 09/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation

class MockScreenNavController: ScreenNavigationControllerProtocol {
    
    var fruitDetailScreen: Bool = false
    
    func displayFruitDetailView(_ type: String) {
        fruitDetailScreen = true
        
    }
    
    
}
