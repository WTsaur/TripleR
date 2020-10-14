//
//  WitInfoViewController.swift
//  TripleR
//
//  Created by William Tsaur on 10/12/20.
//  Copyright © 2020 WORM. All rights reserved.
//

import UIKit

class WitInfoViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var phoneNumField: UITextField!
    @IBOutlet weak var commentTextView: UITextView!
    
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
