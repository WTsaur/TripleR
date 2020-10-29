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
    ])
]
