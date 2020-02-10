//
//  FruitDetailViewController.swift
//  ShowMeTheFruitApp
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 09/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import Foundation
import UIKit

class FruitDetailViewController: UIViewController, FruitDetailViewDelegateProtocol {
    
    var fruitDetailPresenter : FruitDetailPresenter? = nil
    
    var fruitTypeFromSegue: String = ""
    
    @IBOutlet weak var fruitLabel: UILabel!
    //{
//        didSet {
//            self.fruitLabel.attributedText = NSAttributedString(string: fruitTypeFromSegue)
//          }
//    }

    var fruitPriceLabel: Double = -1
    var fruitWeightLabel: Double = -1
    
    func setFruitDetail(fruitSelected: FruitItem?) {
        self.fruitTypeFromSegue = fruitSelected!.type
        self.fruitPriceLabel = fruitSelected!.priceInPounds
        self.fruitWeightLabel = fruitSelected!.weightInKilos
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        fruitDetailPresenter = FruitDetailPresenter(fruitDetailViewDelegate: self, fruitDataService: FruitDataService())
        self.fruitLabel.attributedText = NSAttributedString(string: fruitTypeFromSegue)

        // Do any additional setup after loading the view.
    }

}
