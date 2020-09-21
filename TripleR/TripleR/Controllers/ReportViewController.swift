//
//  ReportViewController.swift
//  TripleR
//
//  Created by William Tsaur on 9/15/20.
//  Copyright © 2020 WORM. All rights reserved.
//

import UIKit
import CoreLocation

class ReportViewController: UIViewController {

    let locationManager = CLLocationManager()
    
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyKilometer
        
    }
    

    @IBAction func homeButtonPressed(_ sender: UIButton) {
    
        self.dismiss(animated: true, completion: nil)
    
    }
    
    @IBAction func locationButtonPressed(_ sender: UIButton) {
    
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
        
        case .authorizedAlways:
            return true
            
        @unknown default:
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
                    self.stateTextField.text = firstloc?.administrativeArea
                    self.cityTextField.text = firstloc?.locality
                    self.addressTextField.text = firstloc?.thoroughfare
                }
            }
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

extension ReportViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
