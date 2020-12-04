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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mediaController.delegate = self
        mediaController.allowsEditing = false
        mediaController.mediaTypes = [kUTTypeMovie as String]
        mediaController.sourceType = .camera
    }
    
    @IBAction func recordButtonPressed(_ sender: EMTNeumorphicButton) {
        //check app permissions for camera, microphone, and photo library
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            present(mediaController, animated: true, completion: nil)
        } else {
            //camera unavailable
        }
        
        let authVidStatus = AVCaptureDevice.authorizationStatus(for: .video)
        let authMicStatus = AVCaptureDevice.authorizationStatus(for: .audio)
        
        if authVidStatus == .denied || authMicStatus == .denied {
            dismiss(animated: true) {
                self.permissionAlert()
            }
        }
    }
    
    func permissionAlert() {
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            // do nothing
        }
        
        let permissionAlert = UIAlertController(title: "Permission Error", message: "This feature requires permission to access your phone's camera, microphone, and photo library. Please navigate to your phone's settings for TripleR and update the app's permissions.", preferredStyle: .alert)
        
        permissionAlert.addAction(okAction)
        
        self.present(permissionAlert, animated: true)

    }
    
    func presentRecorderView() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            present(mediaController, animated: true, completion: nil)
        } else {
            //camera unavailable
        }
    }

}

// MARK: - UIImagePickerControllerDelegate
extension MainViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true, completion: nil)
        let videoURL = info[.mediaURL] as? URL
        let path = videoURL?.path
        if path != nil {
            UISaveVideoAtPathToSavedPhotosAlbum(path!, nil, nil, nil)
        }
    }
}

// MARK: - UINavigationControllerDelegate
extension MainViewController: UINavigationControllerDelegate {
    
}
