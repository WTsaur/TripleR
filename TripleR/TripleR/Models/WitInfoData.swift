//
//  WitInfoData.swift
//  TripleR
//
//  Created by William Tsaur on 10/19/20.
//  Copyright © 2020 WORM. All rights reserved.
//

import Foundation
import RealmSwift

class WitInfoData: Object {
    @objc dynamic var email: String = ""
    @objc dynamic var phoneNum: String = ""
    @objc dynamic var addComments: String = "Additional Comments"
}
