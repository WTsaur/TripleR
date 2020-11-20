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
    
    //local format
    var incident: Incident
    var officer: Officer
    var victim: Victim
    var witness: Witness
    var video: Video
    
    //api format
//    var is_victim: Bool
//    var location_description: LocDescription
//    var witness_information: WitInformation
//    var people_involved: PplInvolved
//    var officer_description: OffDescription
//    var incident_description: IncDescription
}

//MARK: - Local Format

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

//MARK: - API Format

struct LocDescription: Codable {
    var time: String
    var location: String
}

struct WitInformation: Codable {
    var first_name: String
    var last_name: String
    var gender: String
    var home_address: HomeAddr
}

struct HomeAddr: Codable {
    var city: String
    var state: String
    var zip: String
}

struct PplInvolved: Codable {
    var estimated_age: String
    var gender: String
    var ethnicity: String
}

struct OffDescription: Codable {
    var officer_name: String
    var badge_number: String
    var patrol_car_number: Int?
    var license_plate_number: String
    var officer_agency: String
    var eye_color: String
    var hair_color: String
}

struct IncDescription: Codable {
    var identification_showed: Bool
    var force_used: Bool
    var insult_used: [String]
    var weapon_drawn: Bool
    var weapon_fired: Bool
    var comments: String
}


