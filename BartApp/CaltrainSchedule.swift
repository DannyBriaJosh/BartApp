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

enum TrainType {
    case bullet, limited, local
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
    var trainType: TrainType?
    var direction: Direction?
    var timeOfWeek: TimeOfWeek?
    var stops: [Stop]?
    
    
    init(dictionary: [String: Any]){
        if let number = dictionary["number"] as? Int {
            self.number = number
        }
        if let trainType = dictionary["trainType"] as? TrainType {
            self.trainType = trainType
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
        var caltrainScheduleData = [[String: Any]]()
        
        caltrainScheduleData.append(
            [
                "number": 101,
                "trainType": TrainType.local,
                "direction": Direction.northbound,
                "timeOfWeek": TimeOfWeek.weekday,
                "stops":
                    [
                        
                    ]
            ]
        )
        
        var caltrainScheduleArray = [CaltrainSchedule]()
        for i in caltrainScheduleData {
            caltrainScheduleArray.append(CaltrainSchedule(dictionary: i as [String:AnyObject]))
        }
        return caltrainScheduleArray
    }
}
