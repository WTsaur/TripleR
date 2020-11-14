//
//  SettingsViewController.swift
//  TripleR
//
//  Created by William Tsaur on 9/15/20.
//  Copyright © 2020 WORM. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var settingsTableView: UITableView!

    let sectionHeaderHeight: CGFloat = 45
    
    let defaults = UserDefaults.standard
    
    var settingsData: [(header: String, item: [String])] = [
        (header: "Permissions",
         item: [
            "Camera Access",
            "Location Services",
            "Photo Library Access"
        ]),
        (header: "Other Features",
         item: [
            "Lock device when a recording is stopped",
            "Share location to specified contacts when a recording is started"
        ])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        // Do any additional setup after loading the view.
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

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return settingsData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsData[section].item.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sectionHeaderHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: sectionHeaderHeight))
        view.backgroundColor = .none

        let label = UILabel(frame: CGRect(x: 15, y: 0, width: tableView.bounds.width - 30, height: sectionHeaderHeight))
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = UIColor.darkGray
        label.text = settingsData[section].header
        view.addSubview(label)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath)
        let settingDesc = settingsData[indexPath.section].item[indexPath.row]
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.textLabel?.numberOfLines = 2
        cell.textLabel?.textColor = K.customGray
        cell.textLabel?.font = UIFont(name: "Hiragino Sans W7", size: 12)
        cell.textLabel?.text = settingDesc
        
        let uiSwitch = UISwitch()
        let status = defaults.bool(forKey: settingDesc)
        uiSwitch.isOn = status;
        uiSwitch.onTintColor = K.customGreen
        uiSwitch.thumbTintColor = K.customGray
        cell.accessoryView = uiSwitch
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        let prevState = defaults.bool(forKey: cell?.textLabel?.text ?? "")
        defaults.setValue(!prevState, forKey: cell?.textLabel?.text ?? "")
    }
    
}
