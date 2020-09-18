//
//  MainViewController.swift
//  TripleR
//
//  Created by William Tsaur on 9/15/20.
//  Copyright © 2020 WORM. All rights reserved.
//

import UIKit
import CoreLocation
import AVKit
import AVFoundation
import MobileCoreServices

class MainViewController: UIViewController {
    
//    let locationManager = CLLocationManager()
    var mediaController = UIImagePickerController()
    let fileName = "/video.mp4"
    
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        recordingSession = AVAudioSession.sharedInstance()
//
//        do {
//            try recordingSession.setCategory(.playAndRecord, mode: .default)
//            try recordingSession.setActive(true)
//            recordingSession.requestRecordPermission() { [unowned self] allowed in
//                DispatchQueue.main.async {
//                    if allowed {
//                        self.loadRecordingUI()
//                    } else {
//                        // failed to record!
//                    }
//                }
//            }
//        } catch {
//            // failed to record!
//        }
        
        
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
            recordVideo()
        } else if audPerm == true {
            //setupCaptureSession(for: .audio)
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
    
    func recordVideo() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            mediaController.sourceType = .camera
            mediaController.mediaTypes = [kUTTypeMovie as String]
            mediaController.delegate = self
            present(mediaController, animated: true, completion: nil)
        } else {
            //camera is unavailable
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

// MARK: - UIImagePickerControllerDelegate
extension MainViewController: UIImagePickerControllerDelegate {
    
}

// MARK: - UINavigationControllerDelegate
extension MainViewController: UINavigationControllerDelegate {

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
