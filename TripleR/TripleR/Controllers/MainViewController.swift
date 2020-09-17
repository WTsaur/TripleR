//
//  MainViewController.swift
//  TripleR
//
//  Created by William Tsaur on 9/15/20.
//  Copyright © 2020 WORM. All rights reserved.
//

import UIKit
import CoreLocation
import AVFoundation

class MainViewController: UIViewController {
    
//    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        vidPerm = requestMicrophonePermission()
//        audPerm = requestVideoPermission()
        
//        locationManager.delegate = self
//        locationManager.requestWhenInUseAuthorization()
//
//        locationManager.requestLocation()
//        //OR
//        locationManager.startUpdatingLocation()
    }
    
    @IBAction func recordButtonPressed(_ sender: UIButton) {
        //open camera or start a voice recording
        
        //Maybe have setting for user preference on taking video or recording audio
        
        let vidPerm = requestMediaPermission(for: .video)
        let audPerm = requestMediaPermission(for: .audio)
        
        if vidPerm == true {
            setupCaptureSession(for: .video)
        } else if audPerm == true {
            setupCaptureSession(for: .audio)
        } else {
            // Permissions not granted
        }
        
        
    }
    
    /* Maybe don't need the 3 functions below */
    
    @IBAction func settingsButtonPressed(_ sender: UIButton) {
        //code
    }
    
    @IBAction func rightsButtonPressed(_ sender: UIButton) {
        //code
    }
    
    @IBAction func reportButtonPressed(_ sender: UIButton) {
        //code
    }
    
    //MARK: - Capture Media
    
    func setupCaptureSession(for mediaType: AVMediaType) {
        
        let captureSession = AVCaptureSession()

        // Find the default audio device.
        guard let mediaDevice = AVCaptureDevice.default(for: mediaType) else { return }

        do {
            // Wrap the audio device in a capture device input.
            let mediaInput = try AVCaptureDeviceInput(device: mediaDevice)
            // If the input can be added, add it to the session.
            if captureSession.canAddInput(mediaInput) {
                captureSession.addInput(mediaInput)
            }
        } catch {
            fatalError()
        }
        
    }
    
    //MARK: - Request Permissions
    
    func requestMediaPermission(for mediaType: AVMediaType) -> Bool {
        var res = false
        switch AVCaptureDevice.authorizationStatus(for: mediaType) {
            case .authorized: // The user has previously granted access to the camera.
                res = true
            
            case .notDetermined: // The user has not yet been asked for camera access.
                AVCaptureDevice.requestAccess(for: mediaType) { granted in
                    if granted {
                        res = true
                    }
            }
        case .restricted:
            return res
        case .denied:
            return res
        @unknown default:
            fatalError()
        }
        return res
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



//MARK: - CLLocationManagerDelegate

//extension MainViewController: CLLocationManagerDelegate {
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let loc = locations.last {
//            let lat = loc.coordinate.latitude
//            let long = loc.coordinate.longitude
//        }
//    }
//
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print(error)
//    }
//}
