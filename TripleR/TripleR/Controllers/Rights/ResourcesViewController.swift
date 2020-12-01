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
        
        ACLUstring.addAttribute(.link, value: "https://www.aclufl.org/",  range:(ACLUstring.string as NSString).range(of: "American Civil Liberties Union (ACLU)"))
        
        FLstring.addAttribute(.link, value: "http://www.leg.state.fl.us/statutes/index.cfm?App_mode=Display_Statute&URL=0700-0799/0776/0776.html", range:(FLstring.string as NSString).range(of: "Florida Statutes"))

        NAACPstring.addAttribute(.link, value: "http://www.flnaacp.com/local-branch/", range:(NAACPstring.string as NSString).range(of: "National Association for the Advancement of Colored People"))
        
        NAACPstring.addAttribute(NSAttributedString.Key.foregroundColor, value: K.customBlue, range: (NAACPstring.string as NSString).range(of: "National Association for the Advancement of Colored People"))

        ACLUstring.addAttribute(NSAttributedString.Key.foregroundColor, value: K.customBlue, range: (ACLUstring.string as NSString).range(of: "American Civil Liberties Union (ACLU)"))

        FLstring.addAttribute(NSAttributedString.Key.foregroundColor, value: K.customBlue, range: (FLstring.string as NSString).range(of: "Florida Statutes"))
        
        NAACPstring.addAttribute(NSAttributedString.Key.font, value: K.contentFont!, range: (NAACPstring.string as NSString).range(of: "National Association for the Advancement of Colored People"))
        
        ACLUstring.addAttribute(NSAttributedString.Key.font, value: K.contentFont!, range: (ACLUstring.string as NSString).range(of: "American Civil Liberties Union (ACLU)"))
        
        FLstring.addAttribute(NSAttributedString.Key.font, value: K.contentFont!, range: (FLstring.string as NSString).range(of: "Florida Statutes"))
        
        ACLUtextView.attributedText = NSAttributedString(attributedString: ACLUstring)
        
        FLstatutestextview.attributedText = NSAttributedString(attributedString: FLstring)

        NAACPtextView.attributedText = NSAttributedString(attributedString: NAACPstring)
    }
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
           UIApplication.shared.open(URL)
           return false
       }
    
}

    
