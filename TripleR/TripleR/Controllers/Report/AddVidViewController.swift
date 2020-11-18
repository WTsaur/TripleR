//
//  AddVidViewController.swift
//  TripleR
//
//  Created by William Tsaur on 11/10/20.
//  Copyright © 2020 WORM. All rights reserved.
//

import UIKit
import AVKit
import MobileCoreServices
import Photos
import RealmSwift
import EMTNeumorphicView

class AddVidViewController: UIViewController {
    
    @IBOutlet weak var vidAddedImageStatus: UIImageView!
    
    let realm = try! Realm()
    let videoPicker = UIImagePickerController()
    var url: String?
    var vidData = VideoData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        videoPicker.delegate = self
        videoPicker.sourceType = .photoLibrary
        videoPicker.allowsEditing = false
        videoPicker.mediaTypes = [kUTTypeMovie as String]
        
        loadData()
        if checkVideoPicked() {
            vidAddedImageStatus.image = UIImage(systemName: "checkmark")
            vidAddedImageStatus.tintColor = K.customGreen
        } else {
            vidAddedImageStatus.image = UIImage(systemName: "xmark")
            vidAddedImageStatus.tintColor = K.customRed
        }
        // Do any additional setup after loading the view.
    }
    
    @IBAction func unattachVideoButtonPressed(_ sender: EMTNeumorphicButton) {
        url = ""
        saveData()
        vidAddedImageStatus.image = UIImage(systemName: "xmark")
        vidAddedImageStatus.tintColor = K.customRed
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        saveData()
        let vc = ReportViewController()
        vc.videoData = vidData
        dismiss(animated: true, completion: nil)
    }
    
    func loadData() {
        if !realm.isEmpty {
            vidData = realm.objects(VideoData.self).first ?? VideoData()
            url = vidData.url
        }
    }
    
    func saveData() {
        do {
            try realm.write {
                vidData.url = url ?? ""
                realm.add(vidData)
            }
        } catch {
            print("Error saving Video Data \(error)")
        }
    }
    
    func checkVideoPicked() -> Bool {
        if vidData.url == "" {
            return false
        }
        return true
    }
    
    @IBAction func addVideoButtonPressed(_ sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
            present(videoPicker, animated: true, completion: nil)
        }
        
        let status = PHPhotoLibrary.authorizationStatus()
        switch status {
            case PHAuthorizationStatus.denied:
                fallthrough
            case PHAuthorizationStatus.restricted:
                permissionAlert()
            default:
                break
        }
    }
    
    func permissionAlert() {
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            // do nothing
        }
        
        let permissionAlert = UIAlertController(title: "Permission Error", message: "This feature requires permission to access your phone's photo library. Please navigate to your phone's settings for TripleR and update the app's permissions.", preferredStyle: .alert)
        
        permissionAlert.addAction(okAction)
        
        self.present(permissionAlert, animated: true)

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

//MARK: - UIImagePickerControllerDelegate
extension AddVidViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let vidUrl = info[UIImagePickerController.InfoKey.mediaURL] as? URL
        url = vidUrl!.absoluteString
        dismiss(animated: true, completion: nil)
        vidAddedImageStatus.image = UIImage(systemName: "checkmark")
        vidAddedImageStatus.tintColor = K.customGreen
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}

//MARK: - UINavigationControllerDelegate
extension AddVidViewController: UINavigationControllerDelegate {
    
}

