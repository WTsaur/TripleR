//
//  MainViewController.swift
//  TripleR
//
//  Created by William Tsaur on 9/15/20.
//  Copyright © 2020 WORM. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import MobileCoreServices
import EMTNeumorphicView

class MainViewController: UIViewController {
    
    var mediaController = UIImagePickerController()
    
    var recordingSession: AVAudioSession!
    var audioRecorder: AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func recordButtonPressed(_ sender: EMTNeumorphicButton) {
        let vidPerm = requestMediaPermission(for: .video)
        
        if vidPerm == true {
            recordVideo()
        } else {
            // Permissions not granted
        }
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
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
    }
}

// MARK: - UINavigationControllerDelegate
extension MainViewController: UINavigationControllerDelegate {
    
}
