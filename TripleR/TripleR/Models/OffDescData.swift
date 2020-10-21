//
//  OffDescData.swift
//  TripleR
//
//  Created by William Tsaur on 10/19/20.
//  Copyright © 2020 WORM. All rights reserved.
//

import Foundation
import RealmSwift

class OffDescData: Object {
    @objc dynamic var firstName: String = ""
    @objc dynamic var lastName: String = ""
    @objc dynamic var licensePlateNum: String = ""
    @objc dynamic var badgeNum: String = ""
    @objc dynamic var offAgency: String = ""
    @objc dynamic var hairColor: String = ""
    @objc dynamic var eyeColor: String = ""
    @objc dynamic var race: String = ""
    @objc dynamic var gender: String = ""
    @objc dynamic var ageSegNum: Int = 0
    @objc dynamic var uniformed: Int = 0
    @objc dynamic var addComments: String = "Additional Comments"
    @objc dynamic var formIsComplete: Bool = false
}
