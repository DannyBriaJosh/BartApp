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

func timeToDateObject(date: String) -> Date {
    var unformattedDate = ""
    let formatter = DateFormatter()
    formatter.dateFormat = "MM/dd/yyyy"
    unformattedDate += formatter.string(from: Date())
    unformattedDate += date
    formatter.dateFormat = "MM/dd/yyyyhh:mma"
    return formatter.date(from: unformattedDate)!
}

struct CaltrainSchedule {
    var number: Int?
    var trainType: TrainType?
    var direction: Direction?
    var timeOfWeek: TimeOfWeek?
    var stops: [Stop]?
    var stationNames = [String]()
    
    
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
            for stop in stops {
                let stationName = stop.station!.name!
                self.stationNames += [stationName]
            }
        }
    }
}

extension CaltrainSchedule {
    
    static var all: [CaltrainSchedule] {
        let caltrainScheduleData =
            [
                [
                    "number": 101,
                    "trainType": TrainType.local,
                    "direction": Direction.northbound,
                    "timeOfWeek": TimeOfWeek.weekday,
                    "stops":
                        [
                            Stop(station: CaltrainStation.sanjosediridon, time: timeToDateObject(date: "04:28AM")),
                            Stop(station: CaltrainStation.santaclara, time: timeToDateObject(date: "04:33AM")),
                            Stop(station: CaltrainStation.lawrence, time: timeToDateObject(date: "04:39AM")),
                            Stop(station: CaltrainStation.sunnyvale, time: timeToDateObject(date: "04:43AM")),
                            Stop(station: CaltrainStation.mountainview, time: timeToDateObject(date: "04:48AM")),
                            Stop(station: CaltrainStation.sanantonio, time: timeToDateObject(date: "04:52AM")),
                            Stop(station: CaltrainStation.californiaavenue, time: timeToDateObject(date: "04:57AM")),
                            Stop(station: CaltrainStation.paloalto, time: timeToDateObject(date: "05:01AM")),
                            Stop(station: CaltrainStation.menlopark, time: timeToDateObject(date: "05:04AM")),
                            Stop(station: CaltrainStation.redwoodcity, time: timeToDateObject(date: "05:10AM")),
                            Stop(station: CaltrainStation.sancarlos, time: timeToDateObject(date: "05:15AM")),
                            Stop(station: CaltrainStation.belmont, time: timeToDateObject(date: "05:18AM")),
                            Stop(station: CaltrainStation.hillsdale, time: timeToDateObject(date: "05:22AM")),
                            Stop(station: CaltrainStation.hayward, time: timeToDateObject(date: "05:25AM")),
                            Stop(station: CaltrainStation.sanmateo, time: timeToDateObject(date: "05:28AM")),
                            Stop(station: CaltrainStation.burlingame, time: timeToDateObject(date: "05:32AM")),
                            Stop(station: CaltrainStation.millbrae, time: timeToDateObject(date: "05:36AM")),
                            Stop(station: CaltrainStation.sanbruno, time: timeToDateObject(date: "05:41AM")),
                            Stop(station: CaltrainStation.southsanfrancisco, time: timeToDateObject(date: "05:45AM")),
                            Stop(station: CaltrainStation.bayshore, time: timeToDateObject(date: "05:51AM")),
                            Stop(station: CaltrainStation.twentysecondstreet, time: timeToDateObject(date: "05:57AM")),
                            Stop(station: CaltrainStation.sanfrancisco, time: timeToDateObject(date: "06:03AM"))
                        ]
                ],
                [
                    "number": 103,
                    "trainType": TrainType.local ,
                    "direction": Direction.northbound ,
                    "timeOfWeek": TimeOfWeek.weekday ,
                    "stops":
                        [
                            Stop(station: CaltrainStation.tamien, time: timeToDateObject(date: "04:55AM")),
                            Stop(station: CaltrainStation.sanjosediridon, time: timeToDateObject(date: "05:03AM")),
                            Stop(station: CaltrainStation.santaclara, time: timeToDateObject(date: "05:08AM")),
                            Stop(station: CaltrainStation.lawrence, time: timeToDateObject(date: "05:13AM")),
                            Stop(station: CaltrainStation.sunnyvale, time: timeToDateObject(date: "05:18AM")),
                            Stop(station: CaltrainStation.mountainview, time: timeToDateObject(date: "05:23AM")),
                            Stop(station: CaltrainStation.sanantonio, time: timeToDateObject(date: "05:27AM")),
                            Stop(station: CaltrainStation.californiaavenue, time: timeToDateObject(date: "05:31AM")),
                            Stop(station: CaltrainStation.paloalto, time: timeToDateObject(date: "05:36AM")),
                            Stop(station: CaltrainStation.menlopark, time: timeToDateObject(date: "05:39AM")),
                            Stop(station: CaltrainStation.redwoodcity, time: timeToDateObject(date: "05:44AM")),
                            Stop(station: CaltrainStation.sancarlos, time: timeToDateObject(date: "05:49AM")),
                            Stop(station: CaltrainStation.belmont, time: timeToDateObject(date: "05:52AM")),
                            Stop(station: CaltrainStation.hillsdale, time: timeToDateObject(date: "05:56AM")),
                            Stop(station: CaltrainStation.hayward, time: timeToDateObject(date: "05:59AM")),
                            Stop(station: CaltrainStation.sanmateo, time: timeToDateObject(date: "06:03AM")),
                            Stop(station: CaltrainStation.burlingame, time: timeToDateObject(date: "06:06AM")),
                            Stop(station: CaltrainStation.millbrae, time: timeToDateObject(date: "06:11AM")),
                            Stop(station: CaltrainStation.sanbruno, time: timeToDateObject(date: "06:16AM")),
                            Stop(station: CaltrainStation.southsanfrancisco, time: timeToDateObject(date: "06:20AM")),
                            Stop(station: CaltrainStation.bayshore, time: timeToDateObject(date: "06:26AM")),
                            Stop(station: CaltrainStation.twentysecondstreet, time: timeToDateObject(date: "06:32AM")),
                            Stop(station: CaltrainStation.sanfrancisco, time: timeToDateObject(date: "06:38AM"))
                        ]
                ],
                [
                    "number": 305,
                    "trainType": TrainType.bullet ,
                    "direction": Direction.northbound ,
                    "timeOfWeek": TimeOfWeek.weekday ,
                    "stops":
                        [
                            Stop(station: CaltrainStation.sanjosediridon, time: timeToDateObject(date: "05:45AM")),
                            Stop(station: CaltrainStation.mountainview, time: timeToDateObject(date: "06:00AM")),
                            Stop(station: CaltrainStation.paloalto, time: timeToDateObject(date: "06:08AM")),
                            Stop(station: CaltrainStation.hillsdale, time: timeToDateObject(date: "06:18AM")),
                            Stop(station: CaltrainStation.millbrae, time: timeToDateObject(date: "06:26AM")),
                            Stop(station: CaltrainStation.sanfrancisco, time: timeToDateObject(date: "06:47AM"))
                    ]
                ],
                [
                    "number": 207,
                    "trainType": TrainType.limited,
                    "direction": Direction.northbound,
                    "timeOfWeek": TimeOfWeek.weekday,
                    "stops":
                        [
                            Stop(station: CaltrainStation.tamien, time: timeToDateObject(date: "05:51AM")),
                            Stop(station: CaltrainStation.sanjosediridon, time: timeToDateObject(date: "05:59AM")),
                            Stop(station: CaltrainStation.santaclara, time: timeToDateObject(date: "06:06AM")),
                            Stop(station: CaltrainStation.lawrence, time: timeToDateObject(date: "06:12AM")),
                            Stop(station: CaltrainStation.sunnyvale, time: timeToDateObject(date: "06:20AM")),
                            Stop(station: CaltrainStation.mountainview, time: timeToDateObject(date: "06:25AM")),
                            Stop(station: CaltrainStation.sanantonio, time: timeToDateObject(date: "06:29AM")),
                            Stop(station: CaltrainStation.californiaavenue, time: timeToDateObject(date: "06:34AM")),
                            Stop(station: CaltrainStation.paloalto, time: timeToDateObject(date: "06:38AM")),
                            Stop(station: CaltrainStation.menlopark, time: timeToDateObject(date: "06:41AM")),
                            Stop(station: CaltrainStation.redwoodcity, time: timeToDateObject(date: "06:47AM")),
                            Stop(station: CaltrainStation.hillsdale, time: timeToDateObject(date: "06:54AM")),
                            Stop(station: CaltrainStation.millbrae, time: timeToDateObject(date: "07:03AM")),
                            Stop(station: CaltrainStation.southsanfrancisco, time: timeToDateObject(date: "07:09AM")),
                            Stop(station: CaltrainStation.sanfrancisco, time: timeToDateObject(date: "07:24AM"))
                    ]
                ],
                [
                    "number": 309,
                    "trainType": TrainType.bullet,
                    "direction": Direction.northbound,
                    "timeOfWeek": TimeOfWeek.weekday,
                    "stops":
                        [
                            Stop(station: CaltrainStation.tamien, time: timeToDateObject(date: "05:56AM")),
                            Stop(station: CaltrainStation.sanjosediridon, time: timeToDateObject(date: "06:04AM")),
                            Stop(station: CaltrainStation.sunnyvale, time: timeToDateObject(date: "06:14AM")),
                            Stop(station: CaltrainStation.paloalto, time: timeToDateObject(date: "06:26AM")),
                            Stop(station: CaltrainStation.redwoodcity, time: timeToDateObject(date: "06:32AM")),
                            Stop(station: CaltrainStation.sanmateo, time: timeToDateObject(date: "06:43AM")),
                            Stop(station: CaltrainStation.millbrae, time: timeToDateObject(date: "06:51AM")),
                            Stop(station: CaltrainStation.sanfrancisco, time: timeToDateObject(date: "07:08AM"))
                    ]
                ],
                [
                    "number": 211,
                    "trainType": TrainType.limited,
                    "direction": Direction.northbound,
                    "timeOfWeek": TimeOfWeek.weekday,
                    "stops":
                        [
                            Stop(station: CaltrainStation.sanjosediridon, time: timeToDateObject(date: "06:23AM")),
                            Stop(station: CaltrainStation.santaclara, time: timeToDateObject(date: "06:28AM")),
                            Stop(station: CaltrainStation.sunnyvale, time: timeToDateObject(date: "06:36AM")),
                            Stop(station: CaltrainStation.mountainview, time: timeToDateObject(date: "06:42AM")),
                            Stop(station: CaltrainStation.californiaavenue, time: timeToDateObject(date: "06:48AM")),
                            Stop(station: CaltrainStation.menlopark, time: timeToDateObject(date: "06:54AM")),
                            Stop(station: CaltrainStation.redwoodcity, time: timeToDateObject(date: "06:59AM")),
                            Stop(station: CaltrainStation.sancarlos, time: timeToDateObject(date: "07:04AM")),
                            Stop(station: CaltrainStation.belmont, time: timeToDateObject(date: "07:07AM")),
                            Stop(station: CaltrainStation.hillsdale, time: timeToDateObject(date: "07:11AM")),
                            Stop(station: CaltrainStation.hayward, time: timeToDateObject(date: "07:14AM")),
                            Stop(station: CaltrainStation.sanmateo, time: timeToDateObject(date: "07:18AM")),
                            Stop(station: CaltrainStation.burlingame, time: timeToDateObject(date: "07:21AM")),
                            Stop(station: CaltrainStation.millbrae, time: timeToDateObject(date: "07:26AM")),
                            Stop(station: CaltrainStation.sanbruno, time: timeToDateObject(date: "07:30AM")),
                            Stop(station: CaltrainStation.southsanfrancisco, time: timeToDateObject(date: "07:34AM")),
                            Stop(station: CaltrainStation.bayshore, time: timeToDateObject(date: "07:41AM")),
                            Stop(station: CaltrainStation.twentysecondstreet, time: timeToDateObject(date: "07:50AM")),
                            Stop(station: CaltrainStation.sanfrancisco, time: timeToDateObject(date: "07:57AM"))
                    ]
                ],
                [
                    "number": 313,
                    "trainType": TrainType.bullet ,
                    "direction": Direction.northbound ,
                    "timeOfWeek": TimeOfWeek.weekday ,
                    "stops":
                        [
                            Stop(station: CaltrainStation.sanjosediridon, time: timeToDateObject(date: "06:49AM")),
                            Stop(station: CaltrainStation.mountainview, time: timeToDateObject(date: "07:04AM")),
                            Stop(station: CaltrainStation.paloalto, time: timeToDateObject(date: "07:12AM")),
                            Stop(station: CaltrainStation.hillsdale, time: timeToDateObject(date: "07:23AM")),
                            Stop(station: CaltrainStation.millbrae, time: timeToDateObject(date: "07:31AM")),
                            Stop(station: CaltrainStation.sanfrancisco, time: timeToDateObject(date: "07:51AM"))
                    ]
                ],
                [
                    "number": 215,
                    "trainType": TrainType.limited,
                    "direction": Direction.northbound,
                    "timeOfWeek": TimeOfWeek.weekday,
                    "stops":
                        [
                            Stop(station: CaltrainStation.sanjosediridon, time: timeToDateObject(date: "06:54AM")),
                            Stop(station: CaltrainStation.sunnyvale, time: timeToDateObject(date: "07:06AM")),
                            Stop(station: CaltrainStation.mountainview, time: timeToDateObject(date: "07:11AM")),
                            Stop(station: CaltrainStation.californiaavenue, time: timeToDateObject(date: "07:17AM")),
                            Stop(station: CaltrainStation.paloalto, time: timeToDateObject(date: "07:21AM")),
                            Stop(station: CaltrainStation.sancarlos, time: timeToDateObject(date: "07:29AM")),
                            Stop(station: CaltrainStation.hillsdale, time: timeToDateObject(date: "07:34AM")),
                            Stop(station: CaltrainStation.sanmateo, time: timeToDateObject(date: "07:38AM")),
                            Stop(station: CaltrainStation.burlingame, time: timeToDateObject(date: "07:43AM")),
                            Stop(station: CaltrainStation.sanbruno, time: timeToDateObject(date: "07:50AM")),
                            Stop(station: CaltrainStation.sanfrancisco, time: timeToDateObject(date: "08:07AM"))
                    ]
                ],
                [
                    "number": 217,
                    "trainType": TrainType.limited,
                    "direction": Direction.northbound,
                    "timeOfWeek": TimeOfWeek.weekday,
                    "stops":
                        [
                            Stop(station: CaltrainStation.gilroy, time: timeToDateObject(date: "06:06AM")),
                            Stop(station: CaltrainStation.sanmartin, time: timeToDateObject(date: "06:15AM")),
                            Stop(station: CaltrainStation.morganhill, time: timeToDateObject(date: "06:21AM")),
                            Stop(station: CaltrainStation.blossomhill, time: timeToDateObject(date: "06:36AM")),
                            Stop(station: CaltrainStation.capitol, time: timeToDateObject(date: "06:42AM")),
                            Stop(station: CaltrainStation.tamien, time: timeToDateObject(date: "06:50AM")),
                            Stop(station: CaltrainStation.sanjosediridon, time: timeToDateObject(date: "06:59AM")),
                            Stop(station: CaltrainStation.santaclara, time: timeToDateObject(date: "07:06AM")),
                            Stop(station: CaltrainStation.lawrence, time: timeToDateObject(date: "07:12AM")),
                            Stop(station: CaltrainStation.sunnyvale, time: timeToDateObject(date: "07:20AM")),
                            Stop(station: CaltrainStation.mountainview, time: timeToDateObject(date: "07:25AM")),
                            Stop(station: CaltrainStation.sanantonio, time: timeToDateObject(date: "07:29AM")),
                            Stop(station: CaltrainStation.californiaavenue, time: timeToDateObject(date: "07:34AM")),
                            Stop(station: CaltrainStation.paloalto, time: timeToDateObject(date: "07:38AM")),
                            Stop(station: CaltrainStation.menlopark, time: timeToDateObject(date: "07:41AM")),
                            Stop(station: CaltrainStation.redwoodcity, time: timeToDateObject(date: "07:47AM")),
                            Stop(station: CaltrainStation.hillsdale, time: timeToDateObject(date: "07:54AM")),
                            Stop(station: CaltrainStation.millbrae, time: timeToDateObject(date: "08:03AM")),
                            Stop(station: CaltrainStation.southsanfrancisco, time: timeToDateObject(date: "08:09AM")),
                            Stop(station: CaltrainStation.sanfrancisco, time: timeToDateObject(date: "08:24AM"))
                    ]
                ],
                [
                    "number": 319,
                    "trainType": TrainType.bullet,
                    "direction": Direction.northbound,
                    "timeOfWeek": TimeOfWeek.weekday,
                    "stops":
                        [
                            Stop(station: CaltrainStation.tamien, time: timeToDateObject(date: "06:56AM")),
                            Stop(station: CaltrainStation.sanjosediridon, time: timeToDateObject(date: "07:04AM")),
                            Stop(station: CaltrainStation.sunnyvale, time: timeToDateObject(date: "07:14AM")),
                            Stop(station: CaltrainStation.paloalto, time: timeToDateObject(date: "07:26AM")),
                            Stop(station: CaltrainStation.redwoodcity, time: timeToDateObject(date: "07:32AM")),
                            Stop(station: CaltrainStation.sanmateo, time: timeToDateObject(date: "07:43AM")),
                            Stop(station: CaltrainStation.millbrae, time: timeToDateObject(date: "07:51AM")),
                            Stop(station: CaltrainStation.sanfrancisco, time: timeToDateObject(date: "08:11AM"))
                    ]
                ],
                [
                    "number": 221,
                    "trainType": TrainType.limited,
                    "direction": Direction.northbound,
                    "timeOfWeek": TimeOfWeek.weekday,
                    "stops":
                        [
                            Stop(station: CaltrainStation.gilroy, time: timeToDateObject(date: "06:28AM")),
                            Stop(station: CaltrainStation.sanmartin, time: timeToDateObject(date: "06:37AM")),
                            Stop(station: CaltrainStation.morganhill, time: timeToDateObject(date: "06:43AM")),
                            Stop(station: CaltrainStation.blossomhill, time: timeToDateObject(date: "06:58AM")),
                            Stop(station: CaltrainStation.capitol, time: timeToDateObject(date: "07:04AM")),
                            Stop(station: CaltrainStation.tamien, time: timeToDateObject(date: "07:15AM")),
                            Stop(station: CaltrainStation.sanjosediridon, time: timeToDateObject(date: "07:23AM")),
                            Stop(station: CaltrainStation.santaclara, time: timeToDateObject(date: "07:28AM")),
                            Stop(station: CaltrainStation.lawrence, time: timeToDateObject(date: "07:33AM")),
                            Stop(station: CaltrainStation.sunnyvale, time: timeToDateObject(date: "07:38AM")),
                            Stop(station: CaltrainStation.mountainview, time: timeToDateObject(date: "07:44AM")),
                            Stop(station: CaltrainStation.californiaavenue, time: timeToDateObject(date: "07:49AM")),
                            Stop(station: CaltrainStation.menlopark, time: timeToDateObject(date: "07:54AM")),
                            Stop(station: CaltrainStation.redwoodcity, time: timeToDateObject(date: "08:00AM")),
                            Stop(station: CaltrainStation.sancarlos, time: timeToDateObject(date: "08:05AM")),
                            Stop(station: CaltrainStation.belmont, time: timeToDateObject(date: "08:08AM")),
                            Stop(station: CaltrainStation.hillsdale, time: timeToDateObject(date: "08:12AM")),
                            Stop(station: CaltrainStation.hayward, time: timeToDateObject(date: "08:15AM")),
                            Stop(station: CaltrainStation.sanmateo, time: timeToDateObject(date: "08:19AM")),
                            Stop(station: CaltrainStation.burlingame, time: timeToDateObject(date: "08:22AM")),
                            Stop(station: CaltrainStation.millbrae, time: timeToDateObject(date: "08:27AM")),
                            Stop(station: CaltrainStation.sanbruno, time: timeToDateObject(date: "08:31AM")),
                            Stop(station: CaltrainStation.southsanfrancisco, time: timeToDateObject(date: "08:35AM")),
                            Stop(station: CaltrainStation.bayshore, time: timeToDateObject(date: "08:43AM")),
                            Stop(station: CaltrainStation.twentysecondstreet, time: timeToDateObject(date: "08:51AM")),
                            Stop(station: CaltrainStation.sanfrancisco, time: timeToDateObject(date: "08:58AM"))
                    ]
                ],
                [
                    "number": 323,
                    "trainType": TrainType.bullet,
                    "direction": Direction.northbound,
                    "timeOfWeek": TimeOfWeek.weekday,
                    "stops":
                        [
                            Stop(station: CaltrainStation.sanjosediridon, time: timeToDateObject(date: "07:49AM")),
                            Stop(station: CaltrainStation.mountainview, time: timeToDateObject(date: "08:04AM")),
                            Stop(station: CaltrainStation.paloalto, time: timeToDateObject(date: "08:12AM")),
                            Stop(station: CaltrainStation.hillsdale, time: timeToDateObject(date: "08:23AM")),
                            Stop(station: CaltrainStation.millbrae, time: timeToDateObject(date: "08:31AM")),
                            Stop(station: CaltrainStation.sanfrancisco, time: timeToDateObject(date: "08:51AM"))
                    ]
                ],
                [
                    "number": 225,
                    "trainType": TrainType.limited,
                    "direction": Direction.northbound,
                    "timeOfWeek": TimeOfWeek.weekday,
                    "stops":
                        [
                            Stop(station: CaltrainStation.sanjosediridon, time: timeToDateObject(date: "07:54AM")),
                            Stop(station: CaltrainStation.sunnyvale, time: timeToDateObject(date: "08:06AM")),
                            Stop(station: CaltrainStation.mountainview, time: timeToDateObject(date: "08:11AM")),
                            Stop(station: CaltrainStation.californiaavenue, time: timeToDateObject(date: "08:17AM")),
                            Stop(station: CaltrainStation.paloalto, time: timeToDateObject(date: "08:21AM")),
                            Stop(station: CaltrainStation.sancarlos, time: timeToDateObject(date: "08:29AM")),
                            Stop(station: CaltrainStation.hillsdale, time: timeToDateObject(date: "08:34AM")),
                            Stop(station: CaltrainStation.sanmateo, time: timeToDateObject(date: "08:38AM")),
                            Stop(station: CaltrainStation.burlingame, time: timeToDateObject(date: "08:43AM")),
                            Stop(station: CaltrainStation.sanbruno, time: timeToDateObject(date: "08:50AM")),
                            Stop(station: CaltrainStation.sanfrancisco, time: timeToDateObject(date: "09:07AM"))
                    ]
                ],
                [
                    "number": 227,
                    "trainType": TrainType.limited,
                    "direction": Direction.northbound,
                    "timeOfWeek": TimeOfWeek.weekday,
                    "stops":
                        [
                            Stop(station: CaltrainStation.gilroy, time: timeToDateObject(date: "07:06AM")),
                            Stop(station: CaltrainStation.sanmartin, time: timeToDateObject(date: "07:15AM")),
                            Stop(station: CaltrainStation.morganhill, time: timeToDateObject(date: "07:21AM")),
                            Stop(station: CaltrainStation.blossomhill, time: timeToDateObject(date: "07:36AM")),
                            Stop(station: CaltrainStation.capitol, time: timeToDateObject(date: "07:42AM")),
                            Stop(station: CaltrainStation.tamien, time: timeToDateObject(date: "07:53AM")),
                            Stop(station: CaltrainStation.sanjosediridon, time: timeToDateObject(date: "07:59AM")),
                            Stop(station: CaltrainStation.collegepark, time: timeToDateObject(date: "08:03AM")),
                            Stop(station: CaltrainStation.santaclara, time: timeToDateObject(date: "08:08AM")),
                            Stop(station: CaltrainStation.lawrence, time: timeToDateObject(date: "08:14AM")),
                            Stop(station: CaltrainStation.sunnyvale, time: timeToDateObject(date: "08:21AM")),
                            Stop(station: CaltrainStation.mountainview, time: timeToDateObject(date: "08:27AM")),
                            Stop(station: CaltrainStation.sanantonio, time: timeToDateObject(date: "08:31AM")),
                            Stop(station: CaltrainStation.californiaavenue, time: timeToDateObject(date: "08:35AM")),
                            Stop(station: CaltrainStation.paloalto, time: timeToDateObject(date: "08:40AM")),
                            Stop(station: CaltrainStation.menlopark, time: timeToDateObject(date: "08:43AM")),
                            Stop(station: CaltrainStation.redwoodcity, time: timeToDateObject(date: "08:49AM")),
                            Stop(station: CaltrainStation.hillsdale, time: timeToDateObject(date: "08:57AM")),
                            Stop(station: CaltrainStation.millbrae, time: timeToDateObject(date: "09:06AM")),
                            Stop(station: CaltrainStation.southsanfrancisco, time: timeToDateObject(date: "09:13AM")),
                            Stop(station: CaltrainStation.sanfrancisco, time: timeToDateObject(date: "09:29AM")),
                    ]
                ],
                [
                    "number": 329,
                    "trainType": TrainType.bullet,
                    "direction": Direction.northbound,
                    "timeOfWeek": TimeOfWeek.weekday,
                    "stops":
                        [
                            Stop(station: CaltrainStation.tamien, time: timeToDateObject(date: "07:58AM")),
                            Stop(station: CaltrainStation.sanjosediridon, time: timeToDateObject(date: "08:04AM")),
                            Stop(station: CaltrainStation.sunnyvale, time: timeToDateObject(date: "08:14AM")),
                            Stop(station: CaltrainStation.paloalto, time: timeToDateObject(date: "08:26AM")),
                            Stop(station: CaltrainStation.redwoodcity, time: timeToDateObject(date: "08:32AM")),
                            Stop(station: CaltrainStation.sanmateo, time: timeToDateObject(date: "08:43AM")),
                            Stop(station: CaltrainStation.millbrae, time: timeToDateObject(date: "08:51AM")),
                            Stop(station: CaltrainStation.sanfrancisco, time: timeToDateObject(date: "09:11AM"))
                    ]
                ],
                [
                    "number": 231,
                    "trainType": TrainType.limited,
                    "direction": Direction.northbound,
                    "timeOfWeek": TimeOfWeek.weekday,
                    "stops":
                        [
                            Stop(station: CaltrainStation.sanjosediridon, time: timeToDateObject(date: "08:23AM")),
                            Stop(station: CaltrainStation.santaclara, time: timeToDateObject(date: "08:28AM")),
                            Stop(station: CaltrainStation.sunnyvale, time: timeToDateObject(date: "08:36AM")),
                            Stop(station: CaltrainStation.mountainview, time: timeToDateObject(date: "08:42AM")),
                            Stop(station: CaltrainStation.menlopark, time: timeToDateObject(date: "08:51AM")),
                            Stop(station: CaltrainStation.redwoodcity, time: timeToDateObject(date: "08:57AM")),
                            Stop(station: CaltrainStation.sancarlos, time: timeToDateObject(date: "09:02AM")),
                            Stop(station: CaltrainStation.belmont, time: timeToDateObject(date: "09:05AM")),
                            Stop(station: CaltrainStation.hillsdale, time: timeToDateObject(date: "09:09AM")),
                            Stop(station: CaltrainStation.hayward, time: timeToDateObject(date: "09:12AM")),
                            Stop(station: CaltrainStation.sanmateo, time: timeToDateObject(date: "09:15AM")),
                            Stop(station: CaltrainStation.burlingame, time: timeToDateObject(date: "09:19AM")),
                            Stop(station: CaltrainStation.millbrae, time: timeToDateObject(date: "09:24AM")),
                            Stop(station: CaltrainStation.sanbruno, time: timeToDateObject(date: "09:28AM")),
                            Stop(station: CaltrainStation.southsanfrancisco, time: timeToDateObject(date: "09:32AM")),
                            Stop(station: CaltrainStation.bayshore, time: timeToDateObject(date: "09:39AM")),
                            Stop(station: CaltrainStation.twentysecondstreet, time: timeToDateObject(date: "09:45AM")),
                            Stop(station: CaltrainStation.sanfrancisco, time: timeToDateObject(date: "09:52AM"))
                    ]
                ],
                [
                    "number": 233,
                    "trainType": TrainType.limited,
                    "direction": Direction.northbound,
                    "timeOfWeek": TimeOfWeek.weekday,
                    "stops":
                        [
                            Stop(station: CaltrainStation.tamien, time: timeToDateObject(date: "08:28AM")),
                            Stop(station: CaltrainStation.sanjosediridon, time: timeToDateObject(date: "08:36AM")),
                            Stop(station: CaltrainStation.santaclara, time: timeToDateObject(date: "08:41AM")),
                            Stop(station: CaltrainStation.lawrence, time: timeToDateObject(date: "08:47AM")),
                            Stop(station: CaltrainStation.sunnyvale, time: timeToDateObject(date: "08:52AM")),
                            Stop(station: CaltrainStation.mountainview, time: timeToDateObject(date: "08:57AM")),
                            Stop(station: CaltrainStation.sanantonio, time: timeToDateObject(date: "09:01AM")),
                            Stop(station: CaltrainStation.californiaavenue, time: timeToDateObject(date: "09:06AM")),
                            Stop(station: CaltrainStation.paloalto, time: timeToDateObject(date: "09:11AM")),
                            Stop(station: CaltrainStation.menlopark, time: timeToDateObject(date: "09:14AM")),
                            Stop(station: CaltrainStation.redwoodcity, time: timeToDateObject(date: "09:20AM")),
                            Stop(station: CaltrainStation.sancarlos, time: timeToDateObject(date: "09:24AM")),
                            Stop(station: CaltrainStation.belmont, time: timeToDateObject(date: "09:28AM")),
                            Stop(station: CaltrainStation.hillsdale, time: timeToDateObject(date: "09:31AM")),
                            Stop(station: CaltrainStation.sanmateo, time: timeToDateObject(date: "09:36AM")),
                            Stop(station: CaltrainStation.burlingame, time: timeToDateObject(date: "09:39AM")),
                            Stop(station: CaltrainStation.millbrae, time: timeToDateObject(date: "09:44AM")),
                            Stop(station: CaltrainStation.sanbruno, time: timeToDateObject(date: "09:49AM")),
                            Stop(station: CaltrainStation.sanfrancisco, time: timeToDateObject(date: "10:05AM"))
                    ]
                ],
                [
                    "number": 135,
                    "trainType": TrainType.local,
                    "direction": Direction.northbound,
                    "timeOfWeek": TimeOfWeek.weekday,
                    "stops":
                        [
                            Stop(station: CaltrainStation.sanjosediridon, time: timeToDateObject(date: "09:13AM")),
                            Stop(station: CaltrainStation.santaclara, time: timeToDateObject(date: "09:18AM")),
                            Stop(station: CaltrainStation.lawrence, time: timeToDateObject(date: "09:24AM")),
                            Stop(station: CaltrainStation.sunnyvale, time: timeToDateObject(date: "09:28AM")),
                            Stop(station: CaltrainStation.mountainview, time: timeToDateObject(date: "09:34AM")),
                            Stop(station: CaltrainStation.sanantonio, time: timeToDateObject(date: "09:37AM")),
                            Stop(station: CaltrainStation.californiaavenue, time: timeToDateObject(date: "09:41AM")),
                            Stop(station: CaltrainStation.paloalto, time: timeToDateObject(date: "09:46AM")),
                            Stop(station: CaltrainStation.menlopark, time: timeToDateObject(date: "09:49AM")),
                            Stop(station: CaltrainStation.redwoodcity, time: timeToDateObject(date: "09:55AM")),
                            Stop(station: CaltrainStation.sancarlos, time: timeToDateObject(date: "09:59AM")),
                            Stop(station: CaltrainStation.belmont, time: timeToDateObject(date: "10:03AM")),
                            Stop(station: CaltrainStation.hillsdale, time: timeToDateObject(date: "10:06AM")),
                            Stop(station: CaltrainStation.hayward, time: timeToDateObject(date: "10:09AM")),
                            Stop(station: CaltrainStation.sanmateo, time: timeToDateObject(date: "10:12AM")),
                            Stop(station: CaltrainStation.burlingame, time: timeToDateObject(date: "10:15AM")),
                            Stop(station: CaltrainStation.millbrae, time: timeToDateObject(date: "10:20AM")),
                            Stop(station: CaltrainStation.sanbruno, time: timeToDateObject(date: "10:25AM")),
                            Stop(station: CaltrainStation.southsanfrancisco, time: timeToDateObject(date: "10:29AM")),
                            Stop(station: CaltrainStation.bayshore, time: timeToDateObject(date: "10:35AM")),
                            Stop(station: CaltrainStation.twentysecondstreet, time: timeToDateObject(date: "10:41AM")),
                            Stop(station: CaltrainStation.sanfrancisco, time: timeToDateObject(date: "10:48AM"))
                    ]
                ],
                [
                    "number": 237,
                    "trainType": TrainType.limited,
                    "direction": Direction.northbound,
                    "timeOfWeek": TimeOfWeek.weekday,
                    "stops":
                        [
                            Stop(station: CaltrainStation.tamien, time: timeToDateObject(date: "09:37AM")),
                            Stop(station: CaltrainStation.sanjosediridon, time: timeToDateObject(date: "09:50AM")),
                            Stop(station: CaltrainStation.santaclara, time: timeToDateObject(date: "09:55AM")),
                            Stop(station: CaltrainStation.lawrence, time: timeToDateObject(date: "10:00AM")),
                            Stop(station: CaltrainStation.sunnyvale, time: timeToDateObject(date: "10:05AM")),
                            Stop(station: CaltrainStation.mountainview, time: timeToDateObject(date: "10:10AM")),
                            Stop(station: CaltrainStation.sanantonio, time: timeToDateObject(date: "10:14AM")),
                            Stop(station: CaltrainStation.californiaavenue, time: timeToDateObject(date: "10:18AM")),
                            Stop(station: CaltrainStation.paloalto, time: timeToDateObject(date: "10:23AM")),
                            Stop(station: CaltrainStation.menlopark, time: timeToDateObject(date: "10:26AM")),
                            Stop(station: CaltrainStation.redwoodcity, time: timeToDateObject(date: "10:31AM")),
                            Stop(station: CaltrainStation.sancarlos, time: timeToDateObject(date: "10:36AM")),
                            Stop(station: CaltrainStation.belmont, time: timeToDateObject(date: "10:39AM")),
                            Stop(station: CaltrainStation.hillsdale, time: timeToDateObject(date: "10:43AM")),
                            Stop(station: CaltrainStation.sanmateo, time: timeToDateObject(date: "10:48AM")),
                            Stop(station: CaltrainStation.burlingame, time: timeToDateObject(date: "10:51AM")),
                            Stop(station: CaltrainStation.millbrae, time: timeToDateObject(date: "10:56AM")),
                            Stop(station: CaltrainStation.sanbruno, time: timeToDateObject(date: "11:01AM")),
                            Stop(station: CaltrainStation.sanfrancisco, time: timeToDateObject(date: "11:16AM"))
                    ]
                ],
                [
                    "number": 139,
                    "trainType": TrainType.local,
                    "direction": Direction.northbound,
                    "timeOfWeek": TimeOfWeek.weekday,
                    "stops":
                        [
                            Stop(station: CaltrainStation.sanjosediridon, time: timeToDateObject(date: "10:13AM")),
                            Stop(station: CaltrainStation.santaclara, time: timeToDateObject(date: "10:18AM")),
                            Stop(station: CaltrainStation.lawrence, time: timeToDateObject(date: "10:24AM")),
                            Stop(station: CaltrainStation.sunnyvale, time: timeToDateObject(date: "10:28AM")),
                            Stop(station: CaltrainStation.mountainview, time: timeToDateObject(date: "10:33AM")),
                            Stop(station: CaltrainStation.sanantonio, time: timeToDateObject(date: "10:37AM")),
                            Stop(station: CaltrainStation.californiaavenue, time: timeToDateObject(date: "10:41AM")),
                            Stop(station: CaltrainStation.paloalto, time: timeToDateObject(date: "10:47AM")),
                            Stop(station: CaltrainStation.menlopark, time: timeToDateObject(date: "10:50AM")),
                            Stop(station: CaltrainStation.redwoodcity, time: timeToDateObject(date: "10:55AM")),
                            Stop(station: CaltrainStation.sancarlos, time: timeToDateObject(date: "10:59AM")),
                            Stop(station: CaltrainStation.belmont, time: timeToDateObject(date: "11:03AM")),
                            Stop(station: CaltrainStation.hillsdale, time: timeToDateObject(date: "11:06AM")),
                            Stop(station: CaltrainStation.hayward, time: timeToDateObject(date: "11:09AM")),
                            Stop(station: CaltrainStation.sanmateo, time: timeToDateObject(date: "11:12AM")),
                            Stop(station: CaltrainStation.burlingame, time: timeToDateObject(date: "11:15AM")),
                            Stop(station: CaltrainStation.millbrae, time: timeToDateObject(date: "11:20AM")),
                            Stop(station: CaltrainStation.sanbruno, time: timeToDateObject(date: "11:25AM")),
                            Stop(station: CaltrainStation.southsanfrancisco, time: timeToDateObject(date: "11:29AM")),
                            Stop(station: CaltrainStation.bayshore, time: timeToDateObject(date: "11:35AM")),
                            Stop(station: CaltrainStation.twentysecondstreet, time: timeToDateObject(date: "11:41AM")),
                            Stop(station: CaltrainStation.sanfrancisco, time: timeToDateObject(date: "11:48AM"))
                    ]
                ],
                [
                    "number": 143,
                    "trainType": TrainType.local,
                    "direction": Direction.northbound,
                    "timeOfWeek": TimeOfWeek.weekday,
                    "stops":
                        [
                            Stop(station: CaltrainStation.sanjosediridon, time: timeToDateObject(date: "11:13AM")),
                            Stop(station: CaltrainStation.santaclara, time: timeToDateObject(date: "11:18AM")),
                            Stop(station: CaltrainStation.lawrence, time: timeToDateObject(date: "11:24AM")),
                            Stop(station: CaltrainStation.sunnyvale, time: timeToDateObject(date: "11:28AM")),
                            Stop(station: CaltrainStation.mountainview, time: timeToDateObject(date: "11:34AM")),
                            Stop(station: CaltrainStation.sanantonio, time: timeToDateObject(date: "11:37AM")),
                            Stop(station: CaltrainStation.californiaavenue, time: timeToDateObject(date: "11:41AM")),
                            Stop(station: CaltrainStation.paloalto, time: timeToDateObject(date: "11:46AM")),
                            Stop(station: CaltrainStation.menlopark, time: timeToDateObject(date: "11:49AM")),
                            Stop(station: CaltrainStation.redwoodcity, time: timeToDateObject(date: "11:55AM")),
                            Stop(station: CaltrainStation.sancarlos, time: timeToDateObject(date: "11:59AM")),
                            Stop(station: CaltrainStation.belmont, time: timeToDateObject(date: "12:03PM")),
                            Stop(station: CaltrainStation.hillsdale, time: timeToDateObject(date: "12:06PM")),
                            Stop(station: CaltrainStation.hayward, time: timeToDateObject(date: "12:09PM")),
                            Stop(station: CaltrainStation.sanmateo, time: timeToDateObject(date: "12:12PM")),
                            Stop(station: CaltrainStation.burlingame, time: timeToDateObject(date: "12:15PM")),
                            Stop(station: CaltrainStation.millbrae, time: timeToDateObject(date: "12:20PM")),
                            Stop(station: CaltrainStation.sanbruno, time: timeToDateObject(date: "12:25PM")),
                            Stop(station: CaltrainStation.southsanfrancisco, time: timeToDateObject(date: "12:29PM")),
                            Stop(station: CaltrainStation.bayshore, time: timeToDateObject(date: "12:35PM")),
                            Stop(station: CaltrainStation.twentysecondstreet, time: timeToDateObject(date: "12:41PM")),
                            Stop(station: CaltrainStation.sanfrancisco, time: timeToDateObject(date: "12:48PM"))
                    ]
                ],
                [
                    "number": 147,
                    "trainType": TrainType.local,
                    "direction": Direction.northbound,
                    "timeOfWeek": TimeOfWeek.weekday,
                    "stops":
                        [
                            Stop(station: CaltrainStation.sanjosediridon, time: timeToDateObject(date: "12:13PM")),
                            Stop(station: CaltrainStation.santaclara, time: timeToDateObject(date: "12:18PM")),
                            Stop(station: CaltrainStation.lawrence, time: timeToDateObject(date: "12:24PM")),
                            Stop(station: CaltrainStation.sunnyvale, time: timeToDateObject(date: "12:28PM")),
                            Stop(station: CaltrainStation.mountainview, time: timeToDateObject(date: "12:34PM")),
                            Stop(station: CaltrainStation.sanantonio, time: timeToDateObject(date: "12:37PM")),
                            Stop(station: CaltrainStation.californiaavenue, time: timeToDateObject(date: "12:41PM")),
                            Stop(station: CaltrainStation.paloalto, time: timeToDateObject(date: "12:46PM")),
                            Stop(station: CaltrainStation.menlopark, time: timeToDateObject(date: "12:49PM")),
                            Stop(station: CaltrainStation.redwoodcity, time: timeToDateObject(date: "12:55PM")),
                            Stop(station: CaltrainStation.sancarlos, time: timeToDateObject(date: "12:59PM")),
                            Stop(station: CaltrainStation.belmont, time: timeToDateObject(date: "01:03PM")),
                            Stop(station: CaltrainStation.hillsdale, time: timeToDateObject(date: "01:06PM")),
                            Stop(station: CaltrainStation.hayward, time: timeToDateObject(date: "01:09PM")),
                            Stop(station: CaltrainStation.sanmateo, time: timeToDateObject(date: "01:12PM")),
                            Stop(station: CaltrainStation.burlingame, time: timeToDateObject(date: "01:15PM")),
                            Stop(station: CaltrainStation.millbrae, time: timeToDateObject(date: "01:20PM")),
                            Stop(station: CaltrainStation.sanbruno, time: timeToDateObject(date: "01:25PM")),
                            Stop(station: CaltrainStation.southsanfrancisco, time: timeToDateObject(date: "01:29PM")),
                            Stop(station: CaltrainStation.bayshore, time: timeToDateObject(date: "01:35PM")),
                            Stop(station: CaltrainStation.twentysecondstreet, time: timeToDateObject(date: "01:41PM")),
                            Stop(station: CaltrainStation.sanfrancisco, time: timeToDateObject(date: "01:48PM"))
                    ]
                ],
                [
                    "number": 151,
                    "trainType": TrainType.local,
                    "direction": Direction.northbound,
                    "timeOfWeek": TimeOfWeek.weekday,
                    "stops":
                        [
                            Stop(station: CaltrainStation.sanjosediridon, time: timeToDateObject(date: "01:13PM")),
                            Stop(station: CaltrainStation.santaclara, time: timeToDateObject(date: "01:18PM")),
                            Stop(station: CaltrainStation.lawrence, time: timeToDateObject(date: "01:24PM")),
                            Stop(station: CaltrainStation.sunnyvale, time: timeToDateObject(date: "01:28PM")),
                            Stop(station: CaltrainStation.mountainview, time: timeToDateObject(date: "01:34PM")),
                            Stop(station: CaltrainStation.sanantonio, time: timeToDateObject(date: "01:37PM")),
                            Stop(station: CaltrainStation.californiaavenue, time: timeToDateObject(date: "01:41PM")),
                            Stop(station: CaltrainStation.paloalto, time: timeToDateObject(date: "01:46PM")),
                            Stop(station: CaltrainStation.menlopark, time: timeToDateObject(date: "01:49PM")),
                            Stop(station: CaltrainStation.redwoodcity, time: timeToDateObject(date: "01:55PM")),
                            Stop(station: CaltrainStation.sancarlos, time: timeToDateObject(date: "01:59PM")),
                            Stop(station: CaltrainStation.belmont, time: timeToDateObject(date: "02:03PM")),
                            Stop(station: CaltrainStation.hillsdale, time: timeToDateObject(date: "02:06PM")),
                            Stop(station: CaltrainStation.hayward, time: timeToDateObject(date: "02:09PM")),
                            Stop(station: CaltrainStation.sanmateo, time: timeToDateObject(date: "02:12PM")),
                            Stop(station: CaltrainStation.burlingame, time: timeToDateObject(date: "02:15PM")),
                            Stop(station: CaltrainStation.millbrae, time: timeToDateObject(date: "02:20PM")),
                            Stop(station: CaltrainStation.sanbruno, time: timeToDateObject(date: "02:25PM")),
                            Stop(station: CaltrainStation.southsanfrancisco, time: timeToDateObject(date: "02:29PM")),
                            Stop(station: CaltrainStation.bayshore, time: timeToDateObject(date: "02:35PM")),
                            Stop(station: CaltrainStation.twentysecondstreet, time: timeToDateObject(date: "02:41PM")),
                            Stop(station: CaltrainStation.sanfrancisco, time: timeToDateObject(date: "02:48PM"))
                    ]
                ],
                [
                    "number": 155,
                    "trainType": TrainType.local,
                    "direction": Direction.northbound,
                    "timeOfWeek": TimeOfWeek.weekday,
                    "stops":
                        [
                            Stop(station: CaltrainStation.sanjosediridon, time: timeToDateObject(date: "02:13PM")),
                            Stop(station: CaltrainStation.santaclara, time: timeToDateObject(date: "02:18PM")),
                            Stop(station: CaltrainStation.lawrence, time: timeToDateObject(date: "02:24PM")),
                            Stop(station: CaltrainStation.sunnyvale, time: timeToDateObject(date: "02:28PM")),
                            Stop(station: CaltrainStation.mountainview, time: timeToDateObject(date: "02:34PM")),
                            Stop(station: CaltrainStation.sanantonio, time: timeToDateObject(date: "02:37PM")),
                            Stop(station: CaltrainStation.californiaavenue, time: timeToDateObject(date: "02:41PM")),
                            Stop(station: CaltrainStation.paloalto, time: timeToDateObject(date: "02:46PM")),
                            Stop(station: CaltrainStation.menlopark, time: timeToDateObject(date: "02:49PM")),
                            Stop(station: CaltrainStation.redwoodcity, time: timeToDateObject(date: "02:55PM")),
                            Stop(station: CaltrainStation.sancarlos, time: timeToDateObject(date: "02:59PM")),
                            Stop(station: CaltrainStation.belmont, time: timeToDateObject(date: "03:03PM")),
                            Stop(station: CaltrainStation.hillsdale, time: timeToDateObject(date: "03:06PM")),
                            Stop(station: CaltrainStation.hayward, time: timeToDateObject(date: "03:09PM")),
                            Stop(station: CaltrainStation.sanmateo, time: timeToDateObject(date: "03:12PM")),
                            Stop(station: CaltrainStation.burlingame, time: timeToDateObject(date: "03:15PM")),
                            Stop(station: CaltrainStation.millbrae, time: timeToDateObject(date: "03:20PM")),
                            Stop(station: CaltrainStation.sanbruno, time: timeToDateObject(date: "03:25PM")),
                            Stop(station: CaltrainStation.southsanfrancisco, time: timeToDateObject(date: "03:29PM")),
                            Stop(station: CaltrainStation.bayshore, time: timeToDateObject(date: "03:35PM")),
                            Stop(station: CaltrainStation.twentysecondstreet, time: timeToDateObject(date: "03:41PM")),
                            Stop(station: CaltrainStation.sanfrancisco, time: timeToDateObject(date: "03:48PM"))
                    ]
                ],
                [
                    "number": 257,
                    "trainType": TrainType.limited,
                    "direction": Direction.northbound,
                    "timeOfWeek": TimeOfWeek.weekday,
                    "stops":
                        [
                            Stop(station: CaltrainStation.tamien, time: timeToDateObject(date: "02:16PM")),
                            Stop(station: CaltrainStation.sanjosediridon, time: timeToDateObject(date: "02:24PM")),
                            Stop(station: CaltrainStation.santaclara, time: timeToDateObject(date: "02:18PM")),
                            Stop(station: CaltrainStation.lawrence, time: timeToDateObject(date: "02:34PM")),
                            Stop(station: CaltrainStation.sunnyvale, time: timeToDateObject(date: "02:39PM")),
                            Stop(station: CaltrainStation.mountainview, time: timeToDateObject(date: "02:44PM")),
                            Stop(station: CaltrainStation.sanantonio, time: timeToDateObject(date: "02:47PM")),
                            Stop(station: CaltrainStation.californiaavenue, time: timeToDateObject(date: "02:52PM")),
                            Stop(station: CaltrainStation.paloalto, time: timeToDateObject(date: "02:56PM")),
                            Stop(station: CaltrainStation.menlopark, time: timeToDateObject(date: "02:59PM")),
                            Stop(station: CaltrainStation.redwoodcity, time: timeToDateObject(date: "03:05PM")),
                            Stop(station: CaltrainStation.sancarlos, time: timeToDateObject(date: "03:09PM")),
                            Stop(station: CaltrainStation.belmont, time: timeToDateObject(date: "03:13PM")),
                            Stop(station: CaltrainStation.hillsdale, time: timeToDateObject(date: "03:16PM")),
                            Stop(station: CaltrainStation.sanmateo, time: timeToDateObject(date: "03:21PM")),
                            Stop(station: CaltrainStation.burlingame, time: timeToDateObject(date: "03:24PM")),
                            Stop(station: CaltrainStation.millbrae, time: timeToDateObject(date: "03:29PM")),
                            Stop(station: CaltrainStation.sanbruno, time: timeToDateObject(date: "03:33PM")),
                            Stop(station: CaltrainStation.sanfrancisco, time: timeToDateObject(date: "03:50PM"))
                    ]
                ],
                [
                    "number": 159,
                    "trainType": TrainType.local,
                    "direction": Direction.northbound,
                    "timeOfWeek": TimeOfWeek.weekday,
                    "stops":
                        [
                            Stop(station: CaltrainStation.sanjosediridon, time: timeToDateObject(date: "03:13PM")),
                            Stop(station: CaltrainStation.collegepark, time: timeToDateObject(date: "03:16PM")),
                            Stop(station: CaltrainStation.santaclara, time: timeToDateObject(date: "03:20PM")),
                            Stop(station: CaltrainStation.lawrence, time: timeToDateObject(date: "03:25PM")),
                            Stop(station: CaltrainStation.sunnyvale, time: timeToDateObject(date: "03:30PM")),
                            Stop(station: CaltrainStation.mountainview, time: timeToDateObject(date: "03:35PM")),
                            Stop(station: CaltrainStation.sanantonio, time: timeToDateObject(date: "03:39PM")),
                            Stop(station: CaltrainStation.californiaavenue, time: timeToDateObject(date: "03:43PM")),
                            Stop(station: CaltrainStation.paloalto, time: timeToDateObject(date: "03:47PM")),
                            Stop(station: CaltrainStation.menlopark, time: timeToDateObject(date: "03:51PM")),
                            Stop(station: CaltrainStation.redwoodcity, time: timeToDateObject(date: "03:56PM")),
                            Stop(station: CaltrainStation.sancarlos, time: timeToDateObject(date: "04:01PM")),
                            Stop(station: CaltrainStation.belmont, time: timeToDateObject(date: "04:04PM")),
                            Stop(station: CaltrainStation.hillsdale, time: timeToDateObject(date: "04:08PM")),
                            Stop(station: CaltrainStation.hayward, time: timeToDateObject(date: "04:11PM")),
                            Stop(station: CaltrainStation.sanmateo, time: timeToDateObject(date: "04:15PM")),
                            Stop(station: CaltrainStation.burlingame, time: timeToDateObject(date: "04:18PM")),
                            Stop(station: CaltrainStation.millbrae, time: timeToDateObject(date: "04:23PM")),
                            Stop(station: CaltrainStation.sanbruno, time: timeToDateObject(date: "04:28PM")),
                            Stop(station: CaltrainStation.southsanfrancisco, time: timeToDateObject(date: "04:32PM")),
                            Stop(station: CaltrainStation.bayshore, time: timeToDateObject(date: "04:38PM")),
                            Stop(station: CaltrainStation.twentysecondstreet, time: timeToDateObject(date: "04:44PM")),
                            Stop(station: CaltrainStation.sanfrancisco, time: timeToDateObject(date: "04:50PM"))
                    ]
                ]
//                [
//                    "number": ,
//                    "trainType": TrainType.,
//                    "direction": Direction.northbound,
//                    "timeOfWeek": TimeOfWeek.weekday,
//                    "stops":
//                        [
//                            Stop(station: <#T##CaltrainStation#>, time: timeToDateObject(date: String)),
//                            Stop(station: <#T##CaltrainStation#>, time: timeToDateObject(date: String)),
//                            Stop(station: <#T##CaltrainStation#>, time: timeToDateObject(date: String)),
//                            Stop(station: <#T##CaltrainStation#>, time: timeToDateObject(date: String)),
//                            Stop(station: <#T##CaltrainStation#>, time: timeToDateObject(date: String)),
//                            Stop(station: <#T##CaltrainStation#>, time: timeToDateObject(date: String)),
//                            Stop(station: <#T##CaltrainStation#>, time: timeToDateObject(date: String)),
//                            Stop(station: <#T##CaltrainStation#>, time: timeToDateObject(date: String)),
//                            Stop(station: <#T##CaltrainStation#>, time: timeToDateObject(date: String)),
//                            Stop(station: <#T##CaltrainStation#>, time: timeToDateObject(date: String)),
//                            Stop(station: <#T##CaltrainStation#>, time: timeToDateObject(date: String)),
//                            Stop(station: <#T##CaltrainStation#>, time: timeToDateObject(date: String)),
//                            Stop(station: <#T##CaltrainStation#>, time: timeToDateObject(date: String)),
//                            Stop(station: <#T##CaltrainStation#>, time: timeToDateObject(date: String)),
//                            Stop(station: <#T##CaltrainStation#>, time: timeToDateObject(date: String)),
//                            Stop(station: <#T##CaltrainStation#>, time: timeToDateObject(date: String)),
//                            Stop(station: <#T##CaltrainStation#>, time: timeToDateObject(date: String)),
//                            Stop(station: <#T##CaltrainStation#>, time: timeToDateObject(date: String)),
//                            Stop(station: <#T##CaltrainStation#>, time: timeToDateObject(date: String)),
//                            Stop(station: <#T##CaltrainStation#>, time: timeToDateObject(date: String))
//                    ]
//                ],
            ]
        
        var caltrainScheduleArray = [CaltrainSchedule]()
        for i in caltrainScheduleData {
            caltrainScheduleArray.append(CaltrainSchedule(dictionary: i as [String:AnyObject]))
        }
        return caltrainScheduleArray
    }
}

func findCaltrainTrains(start: CaltrainStation, end: CaltrainStation, time: Date, startTime: Bool) -> [CaltrainSchedule] {
    var trains = [CaltrainSchedule]()
    if startTime { //BEST 'START' -> 'END' TRAINS WITH START TIME OF AT LEAST 'TIME'
        for train in CaltrainSchedule.all {
            if train.stationNames.contains(start.name!) && train.stationNames.contains(end.name!) {
                var startStationIndex = -1
                var endStationIndex = -1
                for (index,stop) in train.stops!.enumerated() {
                    if stop.station?.name == start.name {
                        startStationIndex = index
                    } else if stop.station?.name == end.name {
                        endStationIndex = index
                    }
                }
                let startStationTime = train.stops![startStationIndex].time!
                let endStationTime = train.stops![endStationIndex].time!
                if startStationTime < endStationTime {
                    if startStationTime > time {
                        trains.append(train)
                    }
                }
            }
        }
    } else { //BEST 'START' -> 'END' TRAINS WITH END TIME OF AT MOST 'TIME'
        for train in CaltrainSchedule.all.reversed() {
            if train.stationNames.contains(start.name!) && train.stationNames.contains(end.name!) {
                var startStationIndex = -1
                var endStationIndex = -1
                for (index,stop) in train.stops!.enumerated() {
                    if stop.station?.name == start.name {
                        startStationIndex = index
                    } else if stop.station?.name == end.name {
                        endStationIndex = index
                    }
                }
                let startStationTime = train.stops![startStationIndex].time!
                let endStationTime = train.stops![endStationIndex].time!
                if startStationTime < endStationTime {
                    if endStationTime < time {
                        trains.append(train)
                    }
                }
            }
        }
    }
    return trains
}
