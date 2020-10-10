//
//  Field.swift
//  TripleR
//
//  Created by William Tsaur on 10/7/20.
//  Copyright © 2020 WORM. All rights reserved.
//

import Foundation

class Field {
    var text: [String] = []
    var type: String = ""
    
    init(text: [String], type: String) {
        self.text = text
        self.type = type
    }
}
