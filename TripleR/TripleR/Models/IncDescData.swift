//
//  IncDescData.swift
//  TripleR
//
//  Created by William Tsaur on 10/19/20.
//  Copyright © 2020 WORM. All rights reserved.
//

import Foundation
import RealmSwift

class IncDescData: Object {
    @objc dynamic var state: String = ""
    @objc dynamic var city: String = ""
    @objc dynamic var address: String = ""
    @objc dynamic var idCB: Bool = false
    @objc dynamic var forceCB: Bool = false
    @objc dynamic var yellCB: Bool = false
    @objc dynamic var commentCB: Bool = false
    @objc dynamic var weaponCB: Bool = false
    @objc dynamic var reasonCB: Bool = false
    @objc dynamic var date: Date = Date()
    @objc dynamic var time: Date = Date()
    @objc dynamic var addComments: String = "Additional Comments"
    @objc dynamic var formIsComplete: Bool = false
}
