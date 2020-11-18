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
    var is_victim: Bool
    var location_description: LocDescription
    var witness_information: WitInformation
    var people_involved: PplInvolved
    var officer_description: OffDescription
    var incident_description: IncDescription
}

struct LocDescription: Codable {
    var time: String
    var location: String
}

struct HomeAddr: Codable {
    var city: String
    var state: String
    var zip: String
}

struct WitInformation: Codable {
    var first_name: String
    var last_name: String
    var gender: String
    var home_address: HomeAddr
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


