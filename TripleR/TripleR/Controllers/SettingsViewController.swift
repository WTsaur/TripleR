//
//  SettingsViewController.swift
//  TripleR
//
//  Created by William Tsaur on 9/15/20.
//  Copyright © 2020 WORM. All rights reserved.
//

import UIKit
import CoreLocation
import AVFoundation
import Photos

class SettingsViewController: UIViewController {

    let sectionHeaderHeight: CGFloat = 45
    @IBOutlet weak var camSwitch: UISwitch!
    @IBOutlet weak var locSwitch: UISwitch!
    @IBOutlet weak var photoLibSwitch: UISwitch!
    @IBOutlet weak var micSwitch: UISwitch!
    @IBOutlet weak var shareLocSwitch: UISwitch!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let locStatus = CLLocationManager.authorizationStatus()
        if locStatus == .authorizedAlways || locStatus == .authorizedWhenInUse {
            locSwitch.isOn = true
        } else {
            locSwitch.isOn = false
        }
        var phStatus: PHAuthorizationStatus?
        if #available(iOS 14, *) {
            phStatus = PHPhotoLibrary.authorizationStatus(for: PHAccessLevel.addOnly)
        } else {
            // Fallback on earlier versions
        }
        if phStatus == PHAuthorizationStatus.authorized {
            photoLibSwitch.isOn = true
        } else {
            photoLibSwitch.isOn = false
        }

        camSwitch.isOn = checkMediaStatus(for: .video)
        micSwitch.isOn = checkMediaStatus(for: .audio)
        shareLocSwitch.isOn = defaults.bool(forKey: K.shareLoc)
    }
    
    @IBAction func cameraSwitchToggled(_ sender: UISwitch) {
        alert()
        if sender.isOn {
            sender.setOn(false, animated: true)
        } else {
            sender.setOn(true, animated: true)
        }
    }
    
    @IBAction func locationSwitchToggled(_ sender: UISwitch) {
        alert()
        if sender.isOn {
            sender.setOn(false, animated: true)
        } else {
            sender.setOn(true, animated: true)
        }
    }
    
    @IBAction func phSwitchToggled(_ sender: UISwitch) {
        alert()
        if sender.isOn {
            sender.setOn(false, animated: true)
        } else {
            sender.setOn(true, animated: true)
        }
    }
    @IBAction func microphoneSwitchToggled(_ sender: UISwitch) {
        alert()
        if sender.isOn {
            sender.setOn(false, animated: true)
        } else {
            sender.setOn(true, animated: true)
        }
    }
    
    @IBAction func shareLocSwitchToggled(_ sender: UISwitch) {
        defaults.set(sender.isOn, forKey: K.shareLoc)
    }
    
    @IBAction func homeButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func alert() {
        var alert: UIAlertController?
        
        let okAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            // do nothing
        }
        
        let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) -> Void in

            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }

            if UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                })
            }
        }
        
        alert = UIAlertController(title: "Go To Settings?", message: "In order to change these settings, we will take you to your device's settings where you can update TripleR's permissions.", preferredStyle: .alert)
        
        alert?.addAction(settingsAction)
        alert?.addAction(okAction)
        present(alert!, animated: true)
    }
    
    func checkMediaStatus(for: AVMediaType) -> Bool {
        if AVCaptureDevice.authorizationStatus(for: .audio) == AVAuthorizationStatus.authorized {
            return true
        } else {
            return false
        }
    }
}
