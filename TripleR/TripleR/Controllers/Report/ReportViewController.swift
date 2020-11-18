//
//  ReportViewController.swift
//  TripleR
//
//  Created by William Tsaur on 9/15/20.
//  Copyright © 2020 WORM. All rights reserved.
//

import UIKit
import CoreLocation
import RealmSwift
import EMTNeumorphicView

class ReportViewController: UIViewController {
    
    @IBOutlet weak var reportTableView: UITableView!
    
    var realm = try! Realm()
    
    var offDescData: OffDescData? {
        didSet {
            saveData()
        }
    }
    
    var incDescData: IncDescData? {
        didSet {
            saveData()
        }
    }
    
    var witInfoData: WitInfoData? {
        didSet {
            saveData()
        }
    }
    
    var vicInfoData: VicInfoData? {
        didSet {
            saveData()
        }
    }
    
    var videoData: VideoData? {
        didSet {
            saveData()
        }
    }
    
    let categoryRowHeight: CGFloat = 80
    
    let catSegueId = [
        "goToOffDesc",
        "goToIncDesc",
        "goToWitInfo",
        "goToVicInfo",
        "goToAddVid"
    ]
    
    let reportCategories = [
        K.offD,
        K.incD,
        K.witInf,
        K.vicInf,
        K.addVid
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        realm.autorefresh = true
        
        reportTableView.delegate = self
        reportTableView.dataSource = self
    }

    @IBAction func homeButtonPressed(_ sender: UIButton) {
    
        self.dismiss(animated: true, completion: nil)
    
    }
    
    @IBAction func submitReportButtonPressed(_ sender: UIButton) {
        if realm.isEmpty {
            formFillErrorAlert()
            return
        } else {
            loadData()
        }
        
        if offDescData!.formIsComplete && incDescData!.formIsComplete && vicInfoData!.formIsComplete {
            submitConfirmAlert()
        } else {    //send alert saying that not all required portions of the form have been filled out
            formFillErrorAlert()
        }
    }
    
    func submitConfirmAlert() {
        var alert: UIAlertController?
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel) { (action) in
            // do nothing
        }
        
        let submitAction = UIAlertAction(title: "submit", style: .default) { (action) in
            // send data to mongoDB
            
            //reset forms
            self.resetForms()
        }
        
        alert = UIAlertController(title: "Report Confirmation", message: "Are you sure you would like to submit your report?", preferredStyle: .alert)
        
        alert?.addAction(cancelAction)
        alert?.addAction(submitAction)
        present(alert!, animated: true)
    }
    
    func formFillErrorAlert() {
        var alert: UIAlertController?
        let okAction = UIAlertAction(title: "Ok",
                                style: .default) { (action) in
            // Respond to user selection of the action.
        }
        
        alert = UIAlertController(title: "Uh oh!", message: "Not all required report forms have been properly completed.", preferredStyle: .alert)
     
        alert!.addAction(okAction)
        present(alert!, animated: true)
    }
    
    @IBAction func resetFormsButtonPressed(_ sender: EMTNeumorphicButton) {
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            // do nothing
        }
        
        let deleteAction = UIAlertAction(title: "Reset", style: .destructive) { (action) in
            let confirmAction = UIAlertAction(title: "Confirm", style: .destructive) { [self] (resetAction) in
                resetForms()
            }
            
            let denyAction = UIAlertAction(title: "Cancel", style: .cancel) { (cancelAction) in
                // do nothing
            }
            
            let confirmationAlert = UIAlertController(title: "Are you sure?", message: "By pressing 'confirm' all form fields will be reset. This action cannot be undone.", preferredStyle: .alert)
            
            confirmationAlert.addAction(confirmAction)
            confirmationAlert.addAction(denyAction)
            
            self.present(confirmationAlert, animated: true)
        }
        
        let alert = UIAlertController(title: "Reset Form", message: "Would you like to reset all form fields?", preferredStyle: .alert)
        
        alert.addAction(cancelAction)
        alert.addAction(deleteAction)
        
        present(alert, animated: true)
    }
    
    func loadData() {
        let dataOff = realm.objects(OffDescData.self).first ?? OffDescData()
        offDescData = dataOff
        let dataInc = realm.objects(IncDescData.self).first ?? IncDescData()
        incDescData = dataInc
        let dataWit = realm.objects(WitInfoData.self).first ?? WitInfoData()
        witInfoData = dataWit
        let dataVic = realm.objects(VicInfoData.self).first ?? VicInfoData()
        vicInfoData = dataVic
        let dataVid = realm.objects(VideoData.self).first ?? VideoData()
        videoData = dataVid
        print(videoData?.url ?? "nil")
    }
    
    func saveData() {
        do {
            try realm.write {
                realm.add(offDescData ?? OffDescData())
                realm.add(incDescData ?? IncDescData())
                realm.add(witInfoData ?? WitInfoData())
                realm.add(vicInfoData ?? VicInfoData())
                realm.add(videoData ?? VideoData())
            }
        } catch {
            print("Error saving form Data \(error)")
        }
    }
    
    func resetForms() {
        do {
            try self.realm.write {
                realm.deleteAll()
            }
        } catch {
            print("Could not delete Realm data \(error)")
        }
        
        var waitAlert: UIAlertController?
        waitAlert = UIAlertController(title: "Just a second...", message: "Please wait as we clean up your forms.", preferredStyle: .alert)
        self.present(waitAlert!, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            waitAlert?.dismiss(animated: true, completion: nil)
        }
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
        saveData()
        performSegue(withIdentifier: segueId, sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
