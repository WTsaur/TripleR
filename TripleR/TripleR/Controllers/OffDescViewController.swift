//
//  OffDescViewController.swift
//  TripleR
//
//  Created by William Tsaur on 10/12/20.
//  Copyright © 2020 WORM. All rights reserved.
//

import UIKit
import RealmSwift

class OffDescViewController: UIViewController {
    @IBOutlet weak var fNameField: UITextField!
    @IBOutlet weak var lNameField: UITextField!
    @IBOutlet weak var plateNumField: UITextField!
    @IBOutlet weak var badgeNumField: UITextField!
    @IBOutlet weak var offAgencyField: UITextField!
    @IBOutlet weak var hairColorField: UITextField!
    @IBOutlet weak var eyeColorField: UITextField!
    @IBOutlet weak var raceField: UITextField!
    @IBOutlet weak var genderField: UITextField!
    @IBOutlet weak var ageSegCtrl: UISegmentedControl!
    @IBOutlet weak var clothesSegCtrl: UISegmentedControl!
    @IBOutlet weak var commentsTextView: UITextView!
    
    let realm = try! Realm()
    
    var data: OffDescData = OffDescData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.hideKeyboardWhenTappedAround()
        
        loadData()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        saveData()
        let vc = ReportViewController()
        vc.offDescData = data
        self.dismiss(animated: true, completion: nil)
    }
    
    func isFormComplete() -> Bool {
        if genderField.text == "" || hairColorField.text == "" {
            return false
        } else {
            return true
        }
    }
    
    func loadData() {
        data = realm.objects(OffDescData.self).first ?? OffDescData()
        fNameField.text = data.firstName
        lNameField.text = data.lastName
        plateNumField.text = data.licensePlateNum
        badgeNumField.text = data.badgeNum
        offAgencyField.text = data.offAgency
        hairColorField.text = data.hairColor
        eyeColorField.text = data.eyeColor
        raceField.text = data.race
        genderField.text = data.gender
        ageSegCtrl.selectedSegmentIndex = data.ageSegNum
        clothesSegCtrl.selectedSegmentIndex = data.uniformed
        commentsTextView.text = data.addComments
    }
    
    func saveData() {
        do {
            try realm.write {
                data.firstName = fNameField.text ?? ""
                data.lastName = lNameField.text ?? ""
                data.licensePlateNum = plateNumField.text ?? ""
                data.badgeNum = badgeNumField.text ?? ""
                data.offAgency = offAgencyField.text ?? ""
                data.hairColor = hairColorField.text ?? ""
                data.eyeColor = eyeColorField.text ?? ""
                data.race = raceField.text ?? ""
                data.gender = genderField.text ?? ""
                data.ageSegNum = ageSegCtrl.selectedSegmentIndex
                data.uniformed = clothesSegCtrl.selectedSegmentIndex
                data.addComments = commentsTextView.text ?? ""
                data.formIsComplete = isFormComplete()
                realm.add(data)
            }
        } catch {
            print("Error saving Offficer Description Data \(error)")
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
