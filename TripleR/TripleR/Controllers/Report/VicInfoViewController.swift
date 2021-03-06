//
//  VicInfoViewController.swift
//  TripleR
//
//  Created by William Tsaur on 10/12/20.
//  Copyright © 2020 WORM. All rights reserved.
//

import UIKit
import RealmSwift

class VicInfoViewController: UIViewController {
    @IBOutlet weak var raceField: UITextField!
    @IBOutlet weak var genderField: UITextField!
    @IBOutlet weak var commentTextView: UITextView!
    
    let realm = try! Realm()
    
    var data: VicInfoData = VicInfoData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.hideKeyboardWhenTappedAround()
        
        loadData()
        
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        saveData()
        let vc = ReportViewController()
        vc.vicInfoData = data
        self.dismiss(animated: true, completion: nil)
    }
    
    func isFormComplete() -> Bool {
        if raceField.text == "" || genderField.text == "" {
            return false
        } else {
            return true
        }
    }
    
    func loadData() {
        if !realm.isEmpty {
            data = realm.objects(VicInfoData.self).first ?? VicInfoData()
            raceField.text = data.race
            genderField.text = data.gender
            commentTextView.text = data.addComments
        }
    }
    
    func saveData() {
        if commentTextView.text == "Additional Comments" {
            commentTextView.text = ""
        }
        
        do {
            try realm.write {
                data.race = raceField.text ?? ""
                data.gender = genderField.text ?? ""
                data.addComments = commentTextView.text ?? ""
                data.formIsComplete = isFormComplete()
                realm.add(data)
            }
        } catch {
            print("Error saving Victim Information Data \(error)")
        }
    }
}

