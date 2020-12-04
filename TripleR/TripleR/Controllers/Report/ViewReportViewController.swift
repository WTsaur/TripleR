//
//  ViewReportViewController.swift
//  TripleR
//
//  Created by William Tsaur on 11/24/20.
//  Copyright © 2020 WORM. All rights reserved.
//

import UIKit

class ViewReportViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    var data: Report? {
        didSet {
            print("data was set")
        }
    }
    
    let ageMap = ["< 20", "20 - 29", "30 - 39", "40 - 49", "50 - 59", "> 60"]
    let clothMap = ["Uniformed", "Plain Clothes"]
    let offActions = ["identified themselves", "used force", "yelled, cursed, or insulted", "made inappropriate comments/contact", "drew or used a weapon", "cited a reason for stopping/arresting"]
    var offActionText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setText()
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func setText() {
        let myAttributes = [NSAttributedString.Key.font: UIFont(name: "Hiragino Sans W3", size: 16), NSAttributedString.Key.foregroundColor: UIColor(red: 109.0/255.0, green: 109.0/255.0, blue: 109.0/255.0, alpha: 1)]
        
        if let officer = data?.officer,
           let incident = data?.incident,
           let witness = data?.witness,
           let victim = data?.victim {
            let offText = """
                Officer Description
                \n\tName: \(officer.firstName) \(officer.lastName)
                \n\tLicense Plate Number: \(officer.licensePlateNum)
                \n\tBadge Number: \(officer.badgeNum)
                \n\tAgency: \(officer.offAgency)
                \n\tHair Color: \(officer.hairColor)
                \n\tEye Color: \(officer.eyeColor)
                \n\tRace: \(officer.race)
                \n\tGender: \(officer.gender)
                \n\tApprox. Age: \(ageMap[officer.ageSegNum])
                \n\tUniformed or Plain Clothes: \(clothMap[officer.uniformed])
                \n\tAdditional Comments: \(officer.addComments)
                """

            if incident.idCB {
                offActionText += "\t- \(offActions[0])"
            }

            if incident.forceCB {
                offActionText += (offActionText == "") ? "\t- \(offActions[1])" : "\n\t- \(offActions[1])"
            }

            if incident.yellCB {
                offActionText += (offActionText == "") ? "\t- \(offActions[2])" : "\n\t- \(offActions[2])"
            }

            if incident.commentCB {
                offActionText += (offActionText == "") ? "\t- \(offActions[3])" : "\n\t- \(offActions[3])"
            }

            if incident.weaponCB {
                offActionText += (offActionText == "") ? "\t- \(offActions[4])" : "\n\t- \(offActions[4])"
            }

            if incident.reasonCB {
                offActionText += (offActionText == "") ? "\t- \(offActions[5])" : "\n\t- \(offActions[5])"
            }

            if offActionText == "" {
                offActionText += "n/a"
            }

            let incText = """
                \n\nDescription of Incident
                \n\tState: \(incident.state)
                \n\tCity: \(incident.city)
                \n\tAddress: \(incident.address)
                \n\tDate: \(incident.date)
                \n\tTime: \(incident.time)
                \n\tThe Officer...
                \n\(offActionText)
                \n\tAdditional Comments: \(incident.addComments)
                """

            let witText = """
                \n\nWitness Information
                \n\tEmail: \(witness.email)
                \n\tTelephone Number: \(witness.phoneNum)
                \n\tAdditional Comments: \(witness.addComments)
                """

            let vicText = """
                \n\nVictim Information
                \n\tRace: \(victim.race)
                \n\tGender: \(victim.gender)
                \n\tAdditional Comments: \(victim.addComments)
                """

            let fullText = offText + incText + witText + vicText
            
            textView.attributedText = NSAttributedString(string: fullText, attributes: myAttributes as [NSAttributedString.Key : Any])
        }
    }

}
