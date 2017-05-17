//
//  Station.swift
//  BartApp
//
//  Created by Bria Wallace on 5/17/17.
//  Copyright © 2017 Bria Wallace. All rights reserved.
//

import Foundation
import CoreLocation

protocol Station {
    var initial: String? {get set}
    var name: String? {get set}
    var gtfsLatitude: Double? {get set}
    var gtfsLongitude: Double? {get set}
    var address: String? {get set}
    var city: String? {get set}
    var state: String? {get set}
    var zipcode: Int? {get set}
    var stationCoordinate: CLLocationCoordinate2D? {get set}
    var zone: Int? {get set}
    static var allBart: [BartStation] {get}
    static var allCaltrain: [CaltrainStation] {get}
}
