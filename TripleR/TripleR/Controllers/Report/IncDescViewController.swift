//
//  IncDescViewController.swift
//  TripleR
//
//  Created by William Tsaur on 10/12/20.
//  Copyright © 2020 WORM. All rights reserved.
//

import UIKit
import CoreLocation
import EMTNeumorphicView
import RealmSwift

class IncDescViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var stateField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var commentTextView: UITextView!
    
    @IBOutlet weak var identifyCB: EMTNeumorphicButton!
    @IBOutlet weak var forceCB: EMTNeumorphicButton!
    @IBOutlet weak var yellCurseCB: EMTNeumorphicButton!
    @IBOutlet weak var commentCB: EMTNeumorphicButton!
    @IBOutlet weak var weaponCB: EMTNeumorphicButton!
    @IBOutlet weak var citeReasonCB: EMTNeumorphicButton!
    
    let realm = try! Realm()
    
    var data: IncDescData = IncDescData()
    
    let locationManager = CLLocationManager()
    
    let font = UIFont(name: "Hiragino Sans W7", size: 15)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.hideKeyboardWhenTappedAround()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        
        identifyCB.setImage(UIImage(systemName: "checkmark"), for: UIControl.State.selected)
        forceCB.setImage(UIImage(systemName: "checkmark"), for: UIControl.State.selected)
        yellCurseCB.setImage(UIImage(systemName: "checkmark"), for: UIControl.State.selected)
        commentCB.setImage(UIImage(systemName: "checkmark"), for: UIControl.State.selected)
        weaponCB.setImage(UIImage(systemName: "checkmark"), for: UIControl.State.selected)
        citeReasonCB.setImage(UIImage(systemName: "checkmark"), for: UIControl.State.selected)
        
        loadData()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        saveData()
        let vc = ReportViewController()
        vc.incDescData = data
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func autoFillButtonPressed(_ sender: UIButton) {
        locationManager.requestWhenInUseAuthorization()
        
        if let lastLocation = self.locationManager.location {
            let geoCoder = CLGeocoder()
            geoCoder.reverseGeocodeLocation(lastLocation) { (placemarks, error) in
                if error == nil {
                    let firstLoc = placemarks?[0]
                    self.stateField.text = firstLoc?.administrativeArea
                    self.cityField.text = firstLoc?.locality
                    self.addressField.text = firstLoc?.thoroughfare
                }
            }
        }
        
        datePicker.date = Date()
    }
    
    @IBAction func identifyButtonPressed(_ sender: EMTNeumorphicButton) {
        if (identifyCB.isSelected) {
            identifyCB.isSelected = false
        } else {
            identifyCB.isSelected = true
        }
    }
    
    @IBAction func forceButtonPressed(_ sender: EMTNeumorphicButton) {
        if (forceCB.isSelected) {
            forceCB.isSelected = false
        } else {
            forceCB.isSelected = true
        }
    }
    
    @IBAction func yellCurseButtonPressed(_ sender: EMTNeumorphicButton) {
        if (yellCurseCB.isSelected) {
            yellCurseCB.isSelected = false
        } else {
            yellCurseCB.isSelected = true
        }
    }
    
    @IBAction func commentButtonPressed(_ sender: EMTNeumorphicButton) {
        if (commentCB.isSelected) {
            commentCB.isSelected = false
        } else {
            commentCB.isSelected = true
        }
    }
    
    @IBAction func weaponButtonPressed(_ sender: EMTNeumorphicButton) {
        if (weaponCB.isSelected) {
            weaponCB.isSelected = false
        } else {
            weaponCB.isSelected = true
        }
    }
    
    @IBAction func citeReasonButtonPressed(_ sender: EMTNeumorphicButton) {
        if (citeReasonCB.isSelected) {
            citeReasonCB.isSelected = false
        } else {
            citeReasonCB.isSelected = true
        }
    }
    
    func isFormComplete() -> Bool {
        if stateField.text == "" || cityField.text == "" || addressField.text == "" {
            return false
        } else {
            return true
        }
    }
    
    func loadData() {
        if !realm.isEmpty {
            data = realm.objects(IncDescData.self).first ?? IncDescData()
            stateField.text  = data.state
            cityField.text = data.city
            addressField.text = data.address
            identifyCB.isSelected = data.idCB
            forceCB.isSelected = data.forceCB
            yellCurseCB.isSelected = data.yellCB
            commentCB.isSelected = data.commentCB
            weaponCB.isSelected = data.weaponCB
            citeReasonCB.isSelected = data.reasonCB
            commentTextView.text = data.addComments
            datePicker.date = data.date
            timePicker.date = data.time
        } else {
            stateField.text  = ""
            cityField.text =  ""
            addressField.text = ""
            identifyCB.isSelected = false
            forceCB.isSelected = false
            yellCurseCB.isSelected = false
            commentCB.isSelected = false
            weaponCB.isSelected = false
            citeReasonCB.isSelected = false
            commentTextView.text = ""
            datePicker.date = Date()
            timePicker.date = Date()
        }
    }
    
    func saveData() {
        do {
            try realm.write {
                data.state = stateField.text ?? ""
                data.city = cityField.text ?? ""
                data.address = addressField.text ?? ""
                data.idCB = identifyCB.isSelected
                data.forceCB = forceCB.isSelected
                data.yellCB = yellCurseCB.isSelected
                data.commentCB = commentCB.isSelected
                data.weaponCB = weaponCB.isSelected
                data.reasonCB = citeReasonCB.isSelected
                data.addComments = commentTextView.text
                data.date = datePicker.date
                data.time = timePicker.date
                data.formIsComplete = isFormComplete()
                realm.add(data)
            }
        } catch {
            print("Error saving Incident Description Data \(error)")
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

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
