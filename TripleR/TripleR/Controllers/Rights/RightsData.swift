//
//  RightsData.swift
//  TripleR
//
//  Created by Melissa on 10/28/20.
//  Copyright © 2020 WORM. All rights reserved.
//

import Foundation
import CollapsibleTableSectionViewController

//
// MARK: - Section Data Structure
//
public struct Item {
    public var name: String
    public var detail: String
    
    public init(name: String, detail: String) {
        self.name = name
        self.detail = detail
    }
}

public struct Section {
    public var name: String
    public var items: [Item]
    
    public init(name: String, items: [Item]) {
        self.name = name
        self.items = items
    }
}

public var rightsData: [Section] = [
    Section(name: "What are the Miranda Rights?", items: [
        Item(name: "The Miranda Rights have to be read before any “custodial interrogation.” that is, when you are not free to leave AND are being interrogated by a police officer.",
             detail: " • You have the right to remain silent.\n • Anything you say can and will be used against you in a court of law.\n • You have the right to an attorney.\n • If you cannot afford an attorney, one will be provided for you.\n • Do you understand the rights I have just read to you? With these rights in mind, do you wish to speak to me?"
             )
    ]),
    Section(name: "What is a Search and Seizure?", items: [
                Item(name: "An officer may pat you down, but cannot search your person, car, home without your consent or a warrant.",
                     detail:  " • Under the Fourth Amendment, the law enforcement officer cannot search your property without having a warrant, without having you under arrest, or without reason to suspect illegal activity. Anything illegal found without a warrant cannot be seized.\n • If you are being seized or detained, there must be reasonable cause or suspicion you were involved in criminal activity."
                     ),
        Item(name: "Warrant Exceptions:", detail: " • Terry Stops: brief detentions where an officer has reasonable suspicion of criminal activity.\n • Search upon arrest\n • Automobile Searches: an officer can seize any item WITHOUT a warrant if it is in plain sight in the vehicle (during a traffic stop)\n • Home Searches: If a person consents to search of their home, by opening the door or saying they consent, they waive their Fourth Amendment right against unreasonable searches and officers can enter without reasonable suspicion or cause.\n • Exclusionary Rule: If the officer conducts an illegal search and finds incriminating evidence, it cannot be used at trial if there is evidence it was foudn in violation of the Fourth Amendment.\n • Good Faith Exception: An officer can search and seize without warrant and not be penalized if it is determined they acted \"in good faith.\"")
    ]),
    Section(name: "What is the Justifiable Use of Force Law?", items: [
                Item(name: "Self Defense with the Use of Non-Deadly Force", detail: "A person is justified in using or threatening non-deadly force if they believe it is necessary to defend themselves against imminent unlawful force."),
                Item(name: "Self Defense with the Use of Deadly Force", detail: "A person is justified in using or threatening deady force if they believe it is necessary to prevent imminent death or great bodily harm to themselves or another, or to prevent a felony.\n"),
                Item(name: "A law enforcement officer is legally justified in using force when they believe the arrestee poses a serious threat of death or physical threat of harm to themselves or others, to protect themselves, or prevent the arrestee from fleeing with warning.\n", detail: ""),
                Item(name: "However, threats or uses of force are illegal against law enforcement officers performing their official duties and who identified themselves as law enforcement officers.\n", detail: "Otherwise, the person can be arrested, detained in custody, and charged or prosecuted by the officer.\n"),
                Item(name: "Use of Force While Resisting Arrest", detail: "A person cannot use or threaten the use of force while resisting arrest by a law enforcement officer.\n • A law enforcement officer cannot use force if the arrest or execution of their job is unlawful.\n"),
                Item(name: "Deadly Force by a Law Enforcement Officer", detail: "A law enforcement officer cannot be charged civilly or criminally for using less than deadly force such as stun guns.\n • A law enforcement officer can use deadly force, including shooting to kill or inflict great bodily harm, or shooting a vehicle, to prevent the escape of an arrested person from custody, or if they believe it is necessary to prevent imminent death or harm to self or others.\n")
    ]),
    Section(name: "What is the Stop and Frisk Law?", items: [
        Item(name: "An officer may temporarily detain you if they suspect you have committed, are committing, or are about to commit a crime.",
             detail: " • The officer may ask for your identity and what you are doing at the time.\n • They may not detain you longer than is reasonably necessary.\n • They cannot take you anywhere beyond the vicinity of where you were first detained.\n • If there is probable cause for arrest, you will be arrested. But otherwise, you should be released if there they determine there is no cause for suspicion.\n"),
        Item(name: "Can an officer search me while I'm detained?", detail: " • The officer can search you if they suspect you have a weapon, but only to determine whether you have a weapon. If you have one, it may be seized.\n • Any evidence they may find on you can be used in a court of law if it was seized legally.\n")
    ])
]

public var tipsData: [Section] = [
    Section(name: "Tips for Speaking with Law Enforcement", items: [
                Item(name: "", detail: "")]),
    Section(name: "Tips for Dealing with ICE", items: [
                Item(name: "", detail: "")]),
    Section(name: "General Tips", items: [
                Item(name: "", detail: "")])
]

public var resourcesData: [Section] = [
    Section(name: "ACLU", items: [
            Item(name: "", detail: "")])
]

