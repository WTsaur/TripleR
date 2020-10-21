//
//  VicInfoData.swift
//  TripleR
//
//  Created by William Tsaur on 10/19/20.
//  Copyright © 2020 WORM. All rights reserved.
//

import Foundation
import RealmSwift

class VicInfoData: Object {
    @objc dynamic var race: String = ""
    @objc dynamic var gender: String = ""
    @objc dynamic var addComments: String = "Additional Comments"
    @objc dynamic var formIsComplete: Bool = false
}
