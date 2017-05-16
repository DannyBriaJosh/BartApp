//
//  Trip.swift
//  BartApp
//
//  Created by Danny Glover on 5/4/17.
//  Copyright © 2017 Bria Wallace. All rights reserved.
//

import Foundation

struct Trip {
    
    var origin: String?
    var destination: String?
    var fare: String?
    var legs: [Leg]?
    var departureTime: String?
    var arrivalTime: String?
    var scheduleType: String?

}

struct Leg {
    
    var order: Int?
    var origin: String?
    var destination: String?
    var departTime: String?
    var arriveTime: String?
    var line: String? 

}
