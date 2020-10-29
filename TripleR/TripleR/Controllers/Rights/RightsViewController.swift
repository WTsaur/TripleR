//
//  RightsViewController.swift
//  TripleR
//
//  Created by William Tsaur on 9/15/20.
//  Copyright © 2020 WORM. All rights reserved.
//

import UIKit

class RightsViewController: UIViewController {

    @IBOutlet weak var rightsTableView: UITableView!
    
    let categoryRowHeight: CGFloat = 80
    
    let catSegueId = [
        "goToFLRights",
        "goToTips",
        "goToResources"
    ]
    
    let rightsCategories = [
        K.flR,
        K.tips,
        K.resources
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rightsTableView.delegate = self
        rightsTableView.dataSource = self

    }
    
    @IBAction func homeButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    

}

extension RightsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rightsCategories.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt
        indexPath: IndexPath) -> CGFloat {
        return categoryRowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let category = rightsCategories[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.rcatC, for: indexPath)
        
        cell.textLabel?.textColor = K.customGray
        cell.textLabel?.font = UIFont(name: "Hiragino Sans W7", size: 15)
        cell.textLabel?.text = category
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let segueId = catSegueId[indexPath.row]
        performSegue(withIdentifier: segueId, sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
