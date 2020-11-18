//
//  WitInfoViewController.swift
//  TripleR
//
//  Created by William Tsaur on 10/12/20.
//  Copyright © 2020 WORM. All rights reserved.
//

import UIKit
import RealmSwift

class WitInfoViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var phoneNumField: UITextField!
    @IBOutlet weak var commentTextView: UITextView!
    
    let realm = try! Realm()
    
    var data: WitInfoData = WitInfoData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.hideKeyboardWhenTappedAround()
        
        loadData()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        saveData()
        let vc = ReportViewController()
        vc.witInfoData = data
        self.dismiss(animated: true, completion: nil)
    }
    
    func loadData() {
        if !realm.isEmpty {
            data = realm.objects(WitInfoData.self).first ?? WitInfoData()
            emailField.text = data.email
            phoneNumField.text = data.phoneNum
            commentTextView.text = data.addComments
        }
    }
    
    func saveData() {
        do {
            try realm.write {
                data.email = emailField.text ?? ""
                data.phoneNum = phoneNumField.text ?? ""
                data.addComments = commentTextView.text ?? ""
                realm.add(data)
            }
        } catch {
            print("Error saving Witness Information Data \(error)")
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

