//
//  FruitDetailViewController.swift
//  ShowMeTheFruitApp
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 09/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import UIKit

class FruitDetailViewController: UIViewController, FruitDetailViewDelegateProtocol {
    
    var fruitDetailPresenter : FruitDetailPresenter? = nil
    
    var fruitTypeFromSegue: String = ""  {
        didSet {
              DispatchQueue.main.async {
                self.reloadInputViews()
              }
          }
    }
    
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

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
