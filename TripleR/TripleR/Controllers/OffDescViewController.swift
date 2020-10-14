//
//  OffDescViewController.swift
//  TripleR
//
//  Created by William Tsaur on 10/12/20.
//  Copyright © 2020 WORM. All rights reserved.
//

import UIKit

class OffDescViewController: UIViewController {
    @IBOutlet weak var fNameField: UITextField!
    @IBOutlet weak var lNameField: UITextField!
    @IBOutlet weak var plateNumField: UITextField!
    @IBOutlet weak var badgeNumField: UITextField!
    @IBOutlet weak var offAgencyField: UITextField!
    @IBOutlet weak var hairColorField: UITextField!
    @IBOutlet weak var eyeColorField: UITextField!
    @IBOutlet weak var raceField: UITextField!
    @IBOutlet weak var genderField: UITextField!
    @IBOutlet weak var ageSegCtrl: UISegmentedControl!
    @IBOutlet weak var clothesSegCtrl: UISegmentedControl!
    @IBOutlet weak var commentsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
