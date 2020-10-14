//
//  IncDescViewController.swift
//  TripleR
//
//  Created by William Tsaur on 10/12/20.
//  Copyright © 2020 WORM. All rights reserved.
//

import UIKit
import CoreLocation
import CheckboxList

class IncDescViewController: UIViewController {
    @IBOutlet weak var stateField: UITextField!
    @IBOutlet weak var cityField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var checkListView: ChecklistView!
    @IBOutlet weak var commentTextView: UITextView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func autoFillButtonPressed(_ sender: UIButton) {
//        let authStatus = locationManager.authorizationStatus
//        if authStatus == .notDetermined {
//
//        }
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension IncDescViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            
        }
    }
}
