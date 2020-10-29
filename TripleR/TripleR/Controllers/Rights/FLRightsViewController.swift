//
//  FLRightsViewController.swift
//  TripleR
//
//  Created by Melissa on 10/22/20.
//  Copyright © 2020 WORM. All rights reserved.
//

import UIKit
import CollapsibleTableSectionViewController

class FLRightsViewController:  CollapsibleTableSectionViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let sections: [Section] = rightsData

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
    
    
extension FLRightsViewController: CollapsibleTableSectionDelegate {
    func numberOfSections(_ tableView: UITableView) -> Int {
            return sections.count
        }
        
    func collapsibleTableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return sections[section].items.count
        }
        
        func collapsibleTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell: CustomCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? CustomCell ??
                CustomCell(style: .default, reuseIdentifier: "Cell")
            
            let item: Item = sections[(indexPath as NSIndexPath).section].items[(indexPath as NSIndexPath).row]
            
            cell.nameLabel.text = item.name
            cell.detailLabel.text = item.detail
            
            return cell
        }
        
        func collapsibleTableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            return 1.0
        }
        
        func collapsibleTableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return sections[section].name
        }
        
        func shouldCollapseByDefault(_ tableView: UITableView) -> Bool {
            return true
        }
}
    
