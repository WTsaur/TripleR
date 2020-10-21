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
        // Do any additional setup after loading the view.
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
        data = realm.objects(VicInfoData.self).first ?? VicInfoData()
        raceField.text = data.race
        genderField.text = data.gender
        commentTextView.text = data.addComments
    }
    
    func saveData() {
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

