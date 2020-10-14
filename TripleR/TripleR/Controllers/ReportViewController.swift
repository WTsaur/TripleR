//
//  ReportViewController.swift
//  TripleR
//
//  Created by William Tsaur on 9/15/20.
//  Copyright © 2020 WORM. All rights reserved.
//

import UIKit
import CoreLocation

class ReportViewController: UIViewController {
    
    @IBOutlet weak var reportTableView: UITableView!
    
    let categoryRowHeight: CGFloat = 80
    
    let catSegueId = [
        "goToOffDesc",
        "goToIncDesc",
        "goToWitInfo",
        "goToVicInfo"
    ]
    
//    var categorySelected: ReportCategory?
    
    let reportCategories = [
        K.offD,
        K.incD,
        K.witInf,
        K.vicInf
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reportTableView.delegate = self
        reportTableView.dataSource = self
    }

    @IBAction func homeButtonPressed(_ sender: UIButton) {
    
        self.dismiss(animated: true, completion: nil)
    
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

//MARK: - UITableView Delegate and DataSource

extension ReportViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reportCategories.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return categoryRowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let category = reportCategories[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: K.catC, for: indexPath)
        
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
