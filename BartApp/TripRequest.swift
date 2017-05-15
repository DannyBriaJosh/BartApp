//
//  TripRequest.swift
//  BartApp
//
//  Created by Bria Wallace on 5/3/17.
//  Copyright © 2017 Bria Wallace. All rights reserved.
//

import Foundation

struct TripRequest{
    var startStation: BartStation? 
    var endStation: BartStation?
    var departureTime: Date?
    var arrivalTime: Date?
    var timeString: String?
}
