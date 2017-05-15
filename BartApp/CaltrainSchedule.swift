//
//  CaltrainSchedule.swift
//  BartApp
//
//  Created by Bria Wallace on 5/15/17.
//  Copyright © 2017 Bria Wallace. All rights reserved.
//

import Foundation

enum Direction {
    case southbound, northbound
}

enum TimeOfWeek {
    case weekday, weekend
}

struct Stop {
    var station: CaltrainStation?
    var time: Date?
    
    init(station: CaltrainStation, time: Date) {
        self.station = station
        self.time = time
    }
}

struct CaltrainSchedule {
    var number: Int?
    var direction: Direction?
    var timeOfWeek: TimeOfWeek?
    var stops: [Stop]?
    
    init(dictionary: [String: AnyObject]){
        if let number = dictionary["number"] as? Int {
            self.number = number
        }
        if let direction = dictionary["direction"] as? Direction {
            self.direction = direction
        }
        if let timeOfWeek = dictionary["timeOfWeek"] as? TimeOfWeek {
            self.timeOfWeek = timeOfWeek
        }
        if let stops = dictionary["stops"] as? [Stop] {
            self.stops = stops
        }
    }
}

extension CaltrainSchedule {
    
    static var all: [CaltrainSchedule] {
        let caltrainScheduleData = [[String:AnyObject]]()
        
        var caltrainScheduleArray = [CaltrainSchedule]()
        for i in caltrainScheduleData {
            caltrainScheduleArray.append(CaltrainSchedule(dictionary: i as [String:AnyObject]))
        }
        return caltrainScheduleArray
    }
}
