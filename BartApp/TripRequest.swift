//
//  TripRequest.swift
//  BartApp
//
//  Created by Bria Wallace on 5/3/17.
//  Copyright © 2017 Bria Wallace. All rights reserved.
//

import Foundation

struct TripRequest{
    var startStation: Station?
    var endStation: Station?
    var departureTime: Date?
    var arrivalTime: Date?
    var timeString: String?
    var scheduleFormat: String?
}
