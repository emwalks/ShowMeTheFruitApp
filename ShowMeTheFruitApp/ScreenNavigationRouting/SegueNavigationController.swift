//
//  SegueNavigationController.swift
//  ShowMeTheFruitApp
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 09/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation
import UIKit

class SegueNavigationController: ScreenNavigationControllerProtocol {
    
    var viewController: UIViewController
    
    init(_ viewController:UIViewController) {
        self.viewController = viewController
    }
    
    func displayFruitDetailView(_ type: String) {
        viewController.performSegue(withIdentifier: "ViewFruitDetails", sender: type)
    }
    
}

