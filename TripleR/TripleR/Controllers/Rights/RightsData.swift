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
    Section(name: "What is a Forced Entry?", items: [
        Item(name: "The law enforcement officer cannot lawfully enter your residence without a search warrant that has been signed by a judge. They can only enter after \"due notice of officer authority and refusal,\" by announcing they are police.\n", detail: " • Do not open the door.\n • Ask for a signed search warrant.\n • The law enforcement officer has to announce their presence as police and say they have a warrant to enter.\n"),
        Item(name: "What is a No-Knock Entry?", detail: "According to Florida's Knock-and-Announce Statute, an officer may:\n • Break any part of the house, or anything inside, to execute a search warrant, if they have been refused admittance or access to anything inside after announcing they were police and showing the warrant.\n"),
        Item(name: "Exceptions to Requiring a Warrant:", detail: "An officer may enter with force and without announcing themselves if • those inside the house know the officer's reason for being there\n • someone's in danger\n • the officer would put themselves in danger by announcing their process\n • someone inside would escape.\n")
    ]),
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
    Section(name: "What are the Self Defense laws?", items: [
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
                Item(name: "Should I show my personal identification to an officer?", detail: "Yes, if you are stopped on suspicion of a crime or traffic violation. Note this does not apply to FBI or immigration agents."),
                Item(name: "Can I ask if I'm free to leave?", detail: "Ask if you are free to leave. If the officer says \"yes\", exit the scene quietly and slowly. If you are not allowed to leave, you have the right to know why."),
                Item(name: "How do I find out why I'm being detained?", detail: "You have the right to know why you are being arrested or detained. Ask the officer if you are free to go, and if not, ask why you are being stopped calmly.")
    ]),
    Section(name: "Tips for Dealing with ICE", items: [
        Item(name: "ICE has no power without a signed warrant", detail: ""),
        Item(name: "You have zero obligation to provide your name or “show your papers” to an ICE officer for any reason.", detail: "If you voluntarily provide immigration status, you can only do so if you have the papers on you.")
    ]),
    Section(name: "General Tips", items: [
        Item(name: "Do not assume you can leave, ask first.", detail: ""),
        Item(name: "If detained, tell the officer out loud you are exercising your right to remain silent.", detail: "Note that you have to identify yourself to police officers when you are stopped on suspicon of a crime or traffic violation."),
        Item(name: "If you don’t have identification documents, you may choose to remain silent.", detail: "If you want to remain silent, tell the officer out loud you are using your right to remain silent."),
        Item(name: "Do not interfere with police or obstruct them.", detail: "Do not argue, resist, or obstruct the officer, even if you are innocent and the police are violating your rights. Keep your hands where the officer can see them."),
        Item(name: "You are not required to give permission for a search.", detail: "You must not resist physically, but you have the right to refuse a search. If you consent, it can be used against you in court. Say you out loud you refuse a search.")
    ]),
    Section(name: "What to Do in Certain Situations", items: [
        Item(name: "If you are stopped in your vehicle:", detail: " • Turn on the interior light, open the window, and place both hands on the steering wheel in view of the officer.\n • If requested, show personal identification.\n • If the officer asks to search your vehicle, you can deny it vocally but not physically. However, they can search it anyway without your permission.\n • If you are a passenger, you can ask if you are free to leave. If yes, you can remain seated in silence or leave calmly.\n"),
        Item(name: "If the police or immigration agents come to your residence:", detail: " • Do not let them in unless they have a signed warrant or court order.\n • Ask the officer to show you the signed document under the door or through a window.\n • If it is a search warrant, they can enter the home but only search the area for the items in the order.\n • If it is an arrest warrant, they can enter the home if they believe they are inside.\n • If it is a deportation/removal order, or  \"ICE warrant\", they cannot enter the home without your permission.\n • If you choose to speak with them outside your home, step out and close the door."),
        Item(name: "If you are arrested:", detail: " • Do not resist arrest physically, even if you think it is wrong.\n • Say out loud you are using your right to remain silent and ask for a lawyer.\n • Do NOT say, sign, or make decision for anything without a lawyer.\n • You have the right to make one local call, and can ask for it. No officer may listen to your call.\n • Memorize the phone numbers of important contacts such as family and friends if you arrested.\n"),
        Item(name: "If you are arrested or stopped while not a citizen:", detail: " • Do not talk about your immigration status with anyone besides your lawyer.\n • Ask your lawyer about the impact of the arrest on your immigration status.\n"),
        Item(name: "If you are demonstrating or protesting around police presence:", detail: " • You may protest on public property, but on private property, its owners may set limits on your free speech. If you disobey their rules, they can order you off their property.\n • You can record the police anytime you are in an open public space, as long as you are not interfering with police activity.\n • If you are trying to record in a private place, where an incident is less visible tot he public, you can announce that you are recording what is going on as a precaution.\n")
    ])

]

//public var resourcesData: [Section] = [
//    Section(name: "ACLU", items: [
//            Item(name: "", detail: "")]),
//    Section(name: "Florida Statutes", items: [
//                Item(name: "", detail: ""
//                )])
//]

