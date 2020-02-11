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
        
        if let newViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FruitDetailsView") as?  FruitDetailViewController {
              newViewController.fruitTypeFromSegue = type
              viewController.navigationController?.pushViewController(newViewController, animated: true)
          }
    }
    
}

