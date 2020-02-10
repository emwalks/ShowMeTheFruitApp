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
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    var fruitPrice: Double = -1.00
    var fruitWeight: Double = -1.00
    
    func setFruitDetail(fruitSelected: FruitItem?) {
        self.fruitTypeFromSegue = fruitSelected!.type
        self.fruitPrice = fruitSelected!.priceInPounds
        self.fruitWeight = fruitSelected!.weightInKilos
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        fruitDetailPresenter = FruitDetailPresenter(fruitDetailViewDelegate: self, fruitDataService: FruitDataService())
        self.fruitLabel.attributedText = NSAttributedString(string: fruitTypeFromSegue)
        self.priceLabel.attributedText = NSAttributedString(string: "Price: £\(fruitPrice)")
        self.weightLabel.attributedText = NSAttributedString(string: "Weight: \(fruitWeight) kg")
    
    }

}
