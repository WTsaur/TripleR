//
//  formJsonData.swift
//  TripleR
//
//  Created by William Tsaur on 11/18/20.
//  Copyright © 2020 WORM. All rights reserved.
//

import Foundation

struct Reports: Codable {
    var reports: [Report]
}

struct Report: Codable {
    var _id: String
    var reported_by: String
    var incident: Incident
    var officer: Officer
    var victim: Victim
    var witness: Witness
    var video: Video
}

struct Incident: Codable {
    var state: String
    var city: String
    var address: String
    var idCB: Bool
    var forceCB: Bool
    var yellCB: Bool
    var commentCB: Bool
    var weaponCB: Bool
    var reasonCB: Bool
    var date: String
    var time: String
    var addComments: String
}

struct Officer: Codable {
    var firstName: String
    var lastName: String
    var licensePlateNum: String
    var badgeNum: String
    var offAgency: String
    var hairColor: String
    var eyeColor: String
    var race: String
    var gender: String
    var ageSegNum: Int
    var uniformed: Int
    var addComments: String
}

struct Victim: Codable {
    var race: String
    var gender: String
    var addComments: String
}

struct Witness: Codable {
    var email: String
    var phoneNum: String
    var addComments: String
}

struct Video: Codable {
    var url: String
}

