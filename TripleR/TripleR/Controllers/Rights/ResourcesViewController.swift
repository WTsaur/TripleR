//
//  ResourcesViewController.swift
//  TripleR
//
//  Created by Melissa on 10/22/20.
//  Copyright © 2020 WORM. All rights reserved.
//

import UIKit
import CollapsibleTableSectionViewController

class ResourcesViewController:  UIViewController {
    
    @IBOutlet weak var ACLUtextView: UITextView!
    @IBOutlet weak var FLstatutestextview: UITextView!
    @IBOutlet weak var NAACPtextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addHyperlinks()
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func addHyperlinks() {
        let ACLUstring = NSMutableAttributedString(string: "American Civil Liberties Union (ACLU)")
        let FLstring = NSMutableAttributedString(string: "Florida Statutes")
        let NAACPstring = NSMutableAttributedString(string: "National Association for the Advancement of Colored People")
        
        let underline = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single]
        
        ACLUstring.addAttributes(underline, range:(ACLUstring.string as NSString).range(of: "American Civil Liberties Union (ACLU)"))
        ACLUstring.addAttribute(.link, value: "https://www.aclufl.org/",  range:(ACLUstring.string as NSString).range(of: "American Civil Liberties Union (ACLU)"))
        
        FLstring.addAttributes(underline, range:(FLstring.string as NSString).range(of: "Florida Statutes"))
        FLstring.addAttribute(.link, value: "http://www.leg.state.fl.us/statutes/index.cfm?App_mode=Display_Statute&URL=0700-0799/0776/0776.html", range:(FLstring.string as NSString).range(of: "Florida Statutes"))
        
        NAACPstring.addAttributes(underline, range:(NAACPstring.string as NSString).range(of: "National Association for the Advancement of Colored People"))
        NAACPstring.addAttribute(.link, value: "http://www.flnaacp.com/local-branch/", range:(NAACPstring.string as NSString).range(of: "National Association for the Advancement of Colored People"))
        
        ACLUtextView.linkTextAttributes = [
            NSAttributedString.Key.foregroundColor: [K.customGreen]
        ]
        ACLUtextView.attributedText = ACLUstring
       
        FLstatutestextview.linkTextAttributes = [
            NSAttributedString.Key.foregroundColor: [K.customGreen]
        ]
        FLstatutestextview.attributedText = FLstring
        
        NAACPtextView.linkTextAttributes = [
            NSAttributedString.Key.foregroundColor: [K.customGreen]
        ]
        NAACPtextView.attributedText = NAACPstring
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
           UIApplication.shared.open(URL)
           return false
       }
    
}
    
    
