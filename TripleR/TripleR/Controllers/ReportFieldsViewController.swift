//
//  ReportFieldsViewController.swift
//  TripleR
//
//  Created by William Tsaur on 10/6/20.
//  Copyright © 2020 WORM. All rights reserved.
//

import UIKit
import CoreLocation
import CheckboxList

class ReportFieldsViewController: UIViewController {
 
    @IBOutlet weak var autofillButton: UIButton!
    @IBOutlet weak var reportFieldsTableView: UITableView!
    
    let locationManager = CLLocationManager()
    var selectedCategory: ReportCategory?
    let textFieldHeight: CGFloat = 45
    let textViewHeight: CGFloat = 150
    var checkListHeight: CGFloat?
    var reportFields: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if selectedCategory?.title != K.incD {
            autofillButton.isEnabled = false
        }
    
        reportFieldsTableView.delegate = self
        reportFieldsTableView.dataSource = self
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        
        
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func autofillButtonPressed(_ sender: UIButton) {
        locationAutoFill()
        //also update date and time fields
    }
    
    func loadFields() {
        
        reportFieldsTableView.reloadData()
    }
    
    func locationAutoFill() {
        if checkAuthStatus() {
            getLocation()
        } else {
            //Show Alert asking user to give app location permissions in Settings > TripleR > Location Services
        }
    }

    func checkAuthStatus() -> Bool {
        switch CLLocationManager.authorizationStatus() {

        case .authorized:
            return true

        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            return checkAuthStatus()

        case .denied:
            return false

        case .restricted:
            return false

        case .authorizedWhenInUse:
            return true
            
        default:
            return false

        }
    }

    func getLocation() {
        locationManager.requestLocation()

        if let location = locationManager.location {
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
                if error == nil {
                    let firstloc = placemarks?[0]
//                    self.stateTextField.text = firstloc?.administrativeArea
//                    self.cityTextField.text = firstloc?.locality
//                    self.addressTextField.text = firstloc?.thoroughfare
                }
            }
        }
    }
    
}

//MARK: - CLLocationManagerDelegate

extension ReportFieldsViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

extension ReportFieldsViewController: UITableViewDelegate, UITableViewDataSource {
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedCategory?.fields.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let field = selectedCategory?.fields[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: field!.type, for: indexPath)
        
        if field!.type == K.checkC {
            
        }
        
        return cell
    }
}
