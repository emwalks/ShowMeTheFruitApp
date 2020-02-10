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
    
    var arrayOfFruitTypes: Array<String?> = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func setFruit(arrayOfFruitTypes: Array<String?>) {
        self.arrayOfFruitTypes = arrayOfFruitTypes
    }
    
    var fruitListPresenter: FruitListPresenterProtocol? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //this view is passive? Should it know about the actual fruitDataService?
        fruitListPresenter = FruitListPresenter(fruitListViewDelegate: self, fruitDataService: FruitDataService(), screenNavigationController: SegueNavigationController(self))
        tableView.accessibilityIdentifier = "FruitListTable"
        tableView.refreshControl = refreshData
    
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        fruitListCell.textLabel?.text = fruit
        fruitListCell.textLabel?.accessibilityIdentifier = "cellTitleText"
        
        return fruitListCell
        
        
    }
    
    lazy var refreshData: UIRefreshControl? = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor.systemGray
        refreshControl.addTarget(self, action: #selector(reloadData), for: .valueChanged)
        return refreshControl
    }()
    
    @objc func reloadData(){
        fruitListPresenter?.showFruitList()
        tableView.reloadData()
        refreshControl?.endRefreshing()
    }
        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        fruitListPresenter?.showFruitDetailsView(fruitTypeSelected: arrayOfFruitTypes[indexPath.row]!)
 
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ViewFruitDetails" {
            if let fruitDetailViewController = segue.destination as? FruitDetailViewController {
                fruitDetailViewController.fruitTypeFromSegue = (sender as? String)!
            }
        }
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
