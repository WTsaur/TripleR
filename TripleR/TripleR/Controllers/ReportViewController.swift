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
    
    var categorySelected: ReportCategory?
    
    let reportCategories = [
        ReportCategory(title: K.offD, fields: [
            Field(text: ["Name", "Badge Number"], type: K.doubleTFC),
            Field(text: ["License Plate Number", "Officer Agency"], type: K.doubleTFC),
            Field(text: ["Hair Color", "Eye Color"], type: K.doubleTFC),
            Field(text: [""], type: K.segC),
            Field(text: ["Additional Comments"], type: K.textC)
        ]),
        ReportCategory(title: K.incD, fields: [
            Field(text: [""], type: K.dateC),
            Field(text: [""], type: K.timeC),
            Field(text: ["State", "City"], type: K.doubleTFC),
            Field(text: ["Address"], type: K.singleTFC),
            Field(text: [""], type: K.checkC),
            Field(text: ["Additional Comments"], type: K.textC)
        ]),
        ReportCategory(title: K.witInf, fields: [
            Field(text: ["Email", "Phone Number"], type: K.doubleTFC),
            Field(text: ["Additional Comments"], type: K.textC),
        ]),
        ReportCategory(title: K.vicInf, fields: [
            Field(text: ["Race", "Gender"], type: K.doubleTFC),
            Field(text: ["Additional Comments"], type: K.textC)
        ])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reportTableView.delegate = self
        reportTableView.dataSource = self
    }

    @IBAction func homeButtonPressed(_ sender: UIButton) {
    
        self.dismiss(animated: true, completion: nil)
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ReportFieldsViewController
        vc.selectedCategory = categorySelected
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
        cell.textLabel?.text = category.title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        categorySelected = reportCategories[indexPath.row]
        performSegue(withIdentifier: "goToFields", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
