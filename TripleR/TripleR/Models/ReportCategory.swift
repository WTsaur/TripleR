//
//  Category.swift
//  TripleR
//
//  Created by William Tsaur on 10/7/20.
//  Copyright © 2020 WORM. All rights reserved.
//

import Foundation

class ReportCategory {
    var title: String = ""
    var fields: [Field] = []
    
    init(title: String, fields: [Field]) {
        self.title = title
        self.fields = fields
    }
}
