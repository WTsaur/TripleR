//
//  FLRightsViewController.swift
//  TripleR
//
//  Created by Melissa on 10/22/20.
//  Copyright © 2020 WORM. All rights reserved.
//

import UIKit

class FLRightsViewController: UIViewController {
    
    @IBOutlet weak var RightsListScroll: UITextView!
    
    let headingFont = UIFont(name: "Hiragino Sans W7", size: 17)
    let contentFont = UIFont(name: "Hiragino Sans W6", size: 15)

    override func viewDidLoad() {
        super.viewDidLoad()
        RightsListScroll.isEditable = false

        setupTextView()
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupTextView() {
        let miranda = "Miranda Rights\n"
        let mirandaText = "The Miranda Rights have to be read before any “custodial interrogation,” that is, when you are not free to leave AND are being interrogated by a police officer."
        let mirandaAttrib = NSMutableAttributedString(string: miranda, attributes: [NSAttributedString.Key.font: headingFont])
        mirandaAttrib.append(NSAttributedString(string: mirandaText, attributes: [NSAttributedString.Key.font: contentFont, NSAttributedString.Key.foregroundColor: K.customGray]))
        RightsListScroll.attributedText = mirandaAttrib
        
    }

    
}
