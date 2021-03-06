//
//  FruitListTableViewController.swift
//  ShowMeTheFruitApp
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 09/02/2020.
//  Copyright © 2020 Emma Walker - TVandMobile Platforms - Core Engineering. All rights reserved.
//

import UIKit
import Foundation

class FruitListTableViewController: UITableViewController, FruitListViewDelegateProtocol {
    var fruitListPresenter: FruitListPresenterProtocol?
    
    private var viewWillAppearDate: Date?
    private var arrayOfFruitTypes: Array<String?> = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func setFruit(arrayOfFruitTypes: Array<String?>) {
        self.arrayOfFruitTypes = arrayOfFruitTypes
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //this view should be passive? Should it know about the actual fruitDataService? Or even the presenter? 🧐
        fruitListPresenter = FruitListPresenter(fruitListViewDelegate: self, fruitDataService: FruitDataService(), screenNavigationController: SegueNavigationController(self))
        tableView.accessibilityIdentifier = "FruitListTable"
        tableView.refreshControl = refreshData
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewWillAppearDate = Date()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let viewWillAppearDate = viewWillAppearDate {
            fruitListPresenter?.sendDisplayStatistics(timeTaken: Date().timeIntervalSince(viewWillAppearDate))
            self.viewWillAppearDate = nil
        }
    }
    
    lazy private var refreshData: UIRefreshControl? = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor.systemGray
        refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
        return refreshControl
    }()
    
    @objc private func reloadData(){
        fruitListPresenter?.showFruitList()
        tableView.reloadData()
        refreshControl?.endRefreshing()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfFruitTypes.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let fruitListCell = tableView.dequeueReusableCell(withIdentifier: "fruitListCell", for: indexPath)
        
        let fruit = arrayOfFruitTypes[indexPath.row]
        fruitListCell.textLabel?.text = fruit?.capitalizingFirstLetter()
        fruitListCell.textLabel?.accessibilityIdentifier = "cellTitleText"
        
        return fruitListCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        fruitListPresenter?.showFruitDetailsView(fruitTypeSelected: arrayOfFruitTypes[indexPath.row]!)
        
    }
    
}
