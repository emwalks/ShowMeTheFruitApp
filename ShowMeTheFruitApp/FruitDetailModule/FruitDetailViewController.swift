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
    
    private var fruitDetailPresenter : FruitDetailPresenter?
    private var viewWillAppearDate: Date?
    
    var fruitTypeFromSegue: String = ""
    
    @IBOutlet weak var fruitLabel: UILabel! {
        didSet {
            DispatchQueue.main.async {
                self.fruitLabel.attributedText = NSAttributedString(string: self.fruitTypeFromSegue)
            }
        }
    }
    @IBOutlet weak var priceLabel: UILabel! {
        didSet {
            DispatchQueue.main.async {
                self.priceLabel.attributedText = NSAttributedString(string: "Price: £\(self.fruitPrice)")
            }
        }
    }
    @IBOutlet weak var weightLabel: UILabel! {
        didSet {
            DispatchQueue.main.async {
                self.weightLabel.attributedText = NSAttributedString(string: "Weight: \(self.fruitWeight) kg")
            }
        }
    }
    
    var fruitPrice: Double = -1.00
    var fruitWeight: Double = -1.00
    
    func setFruitDetail(fruitSelected: FruitItem?) {
        self.fruitTypeFromSegue = fruitSelected!.typeCapital
        self.fruitPrice = fruitSelected!.priceInPounds
        self.fruitWeight = fruitSelected!.weightInKilos
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fruitDetailPresenter = FruitDetailPresenter(fruitDetailViewDelegate: self, fruitDataService: FruitDataService())
        priceLabel.accessibilityIdentifier = "pricePresented"
        weightLabel.accessibilityIdentifier = "weightPresented"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewWillAppearDate = Date()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let viewWillAppearDate = viewWillAppearDate {
            fruitDetailPresenter?.sendDisplayStatistics(timeTaken: Date().timeIntervalSince(viewWillAppearDate))
                self.viewWillAppearDate = nil
            }
    }
    
}
