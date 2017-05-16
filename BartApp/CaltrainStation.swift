//
//  CaltrainStation.swift
//  BartApp
//
//  Created by Bria Wallace on 5/8/17.
//  Copyright © 2017 Bria Wallace. All rights reserved.
//

import Foundation
import CoreLocation

class CaltrainStation {
    
    var initial: String?
    var name: String?
    var gtfsLatitude: Double?
    var gtfsLongitude: Double?
    var address: String?
    var city: String?
    var state: String?
    var zipcode: Int?
    var stationCoordinate: CLLocationCoordinate2D?
    var zone: Int?
    
    init(dictionary: [String: AnyObject]){
        if let initial = dictionary["initial"] as? String {
            self.initial = initial
        }
        
        if let name = dictionary["name"] as? String {
            self.name = name
        }
        
        if let gtfsLatitude = dictionary["gtfs_latitude"] as? Double {
            self.gtfsLatitude = gtfsLatitude
        }
        
        if let gtfsLongitude = dictionary["gtfs_longitude"] as? Double {
            self.gtfsLongitude = gtfsLongitude
        }
        
        if let address = dictionary["address"] as? String {
            self.address = address
        }
        
        if let city = dictionary["city"] as? String {
            self.city = city
        }
        
        if let state = dictionary["state"] as? String {
            self.state = state
        }
        
        if let zipcode = dictionary["zipcode"] as? Int {
            self.zipcode = zipcode
        }
        
        if gtfsLatitude != nil && gtfsLongitude != nil {
            stationCoordinate = CLLocationCoordinate2D(latitude: gtfsLatitude!, longitude: gtfsLongitude!)
        }
        
        if let zone = dictionary["zone"] as? Int {
            self.zone = zone
        }
    }
}

extension CaltrainStation {
    
    static var all: [CaltrainStation] {
        let caltrainStationData =
            [
                [
                    "initial": "SFRAN",
                    "name": "San Francisco Caltrain",
                    "gtfs_latitude": 37.776348,
                    "gtfs_longitude": -122.394935,
                    "address": "700 4th St, San Francisco",
                    "city": "San Francisco",
                    "state": "CA",
                    "zipcode": 94107,
                    "zone": 1
                ],
                [
                    "initial": "22ND",
                    "name": "22nd Street",
                    "gtfs_latitude": 37.757583,
                    "gtfs_longitude": -122.392404,
                    "address": "1149 22nd Street",
                    "city": "San Francisco",
                    "state": "CA",
                    "zipcode": 94107,
                    "zone": 1
                ],
                [
                    "initial": "BYSH",
                    "name": "Bayshore",
                    "gtfs_latitude": 37.709544,
                    "gtfs_longitude": -122.40198,
                    "address": "400 Tunnel Avenue",
                    "city": "San Francisco",
                    "state": "CA",
                    "zipcode": 94134,
                    "zone": 1
                ],
                [
                    "initial": "SSFRAN",
                    "name": "South San Francisco",
                    "gtfs_latitude": 37.655946,
                    "gtfs_longitude": -122.405018,
                    "address": "590 Dubuque Avenue",
                    "city": "South San Francisco",
                    "state": "CA",
                    "zipcode": 94080,
                    "zone": 1
                ],
                [
                    "initial": "SBRN",
                    "name": "San Bruno",
                    "gtfs_latitude": 37.631108,
                    "gtfs_longitude": -122.412076,
                    "address": "833 E San Mateo Avenue",
                    "city": "San Bruno",
                    "state": "CA",
                    "zipcode": 94066,
                    "zone": 1
                ],
                [
                    "initial": "MLB",
                    "name": "Millbrae",
                    "gtfs_latitude": 37.599797,
                    "gtfs_longitude": -122.386832,
                    "address": "100 California Drive",
                    "city": "Millbrae",
                    "state": "CA",
                    "zipcode": 94030,
                    "zone": 2
                ],
                [
                    "initial": "BRD",
                    "name": "Broadway",
                    "gtfs_latitude": 37.587552,
                    "gtfs_longitude": -122.362708,
                    "address": "1190 California Drive",
                    "city": "Burlingame",
                    "state": "CA",
                    "zipcode": 94010,
                    "zone": 2
                ],
                [
                    "initial": "BLG",
                    "name": "Burlingame",
                    "gtfs_latitude": 37.580186,
                    "gtfs_longitude": -122.345075,
                    "address": "290 California Drive",
                    "city": "Burlingame",
                    "state": "CA",
                    "zipcode": 94010,
                    "zone": 2
                ],
                [
                    "initial": "SMAT",
                    "name": "San Mateo",
                    "gtfs_latitude": 37.568294,
                    "gtfs_longitude": -122.324092,
                    "address": "385 First Avenue",
                    "city": "San Mateo",
                    "state": "CA",
                    "zipcode": 94401,
                    "zone": 2
                ],
                [
                    "initial": "HWD",
                    "name": "Hayward Park",
                    "gtfs_latitude": 37.552994,
                    "gtfs_longitude": -122.309608,
                    "address": "401 Concar Drive",
                    "city": "San Mateo",
                    "state": "CA",
                    "zipcode": 94402,
                    "zone": 2
                ],
                [
                    "initial": "HDL",
                    "name": "Hillsdale",
                    "gtfs_latitude": 37.537814,
                    "gtfs_longitude": -122.297461,
                    "address": "3333 El Camino Real",
                    "city": "San Mateo",
                    "state": "CA",
                    "zipcode": 94403,
                    "zone": 2
                ],
                [
                    "initial": "BLM",
                    "name": "Belmont",
                    "gtfs_latitude": 37.520844,
                    "gtfs_longitude": -122.275816,
                    "address": "995 El Camino Real",
                    "city": "Belmont",
                    "state": "CA",
                    "zipcode": 94402,
                    "zone": 2
                ],
                [
                    "initial": "SCRL",
                    "name": "San Carlos",
                    "gtfs_latitude": 37.507933,
                    "gtfs_longitude": -122.260266,
                    "address": "599 El Camino Real",
                    "city": "San Carlos",
                    "state": "CA",
                    "zipcode": 94070,
                    "zone": 2
                ],
                [
                    "initial": "RDW",
                    "name": "Redwood City",
                    "gtfs_latitude": 37.486101,
                    "gtfs_longitude": -122.232,
                    "address": "1 James Avenue",
                    "city": "Redwood City",
                    "state": "CA",
                    "zipcode": 94063,
                    "zone": 2
                ],
                [
                    "initial": "ATH",
                    "name": "Atherton",
                    "gtfs_latitude": 37.464584,
                    "gtfs_longitude": -122.197869,
                    "address": "1 Dinkelspiel Station Lane",
                    "city": "Atherton",
                    "state": "CA",
                    "zipcode": 94027,
                    "zone": 3
                ],
                [
                    "initial": "MNP",
                    "name": "Menlo Park",
                    "gtfs_latitude": 37.454745,
                    "gtfs_longitude": -122.182405,
                    "address": "1120 Merrill St",
                    "city": "Menlo Park",
                    "state": "CA",
                    "zipcode": 94025,
                    "zone": 3
                ],
                [
                    "initial": "PAAL",
                    "name": "Palo Alto",
                    "gtfs_latitude": 37.443405,
                    "gtfs_longitude": -122.164697,
                    "address": "95 University Ave",
                    "city": "Palo Alto",
                    "state": "CA",
                    "zipcode": 94301,
                    "zone": 3
                ],
                [
                    "initial": "CALA",
                    "name": "California Avenue",
                    "gtfs_latitude": 37.429333,
                    "gtfs_longitude": -122.141978,
                    "address": "101 California Avenue",
                    "city": "Palo Alto",
                    "state": "CA",
                    "zipcode": 94306,
                    "zone": 3
                ],
                [
                    "initial": "SANT",
                    "name": "San Antonio",
                    "gtfs_latitude": 37.407277,
                    "gtfs_longitude": -122.107125,
                    "address": "190 Showers Drive",
                    "city": "Mountain View",
                    "state": "CA",
                    "zipcode": 94040,
                    "zone": 3
                ],
                [
                    "initial": "MTVW",
                    "name": "Mountain View",
                    "gtfs_latitude": 37.394402,
                    "gtfs_longitude": -122.075994,
                    "address": "600 W. Evelyn Avenue",
                    "city": "Mountain View",
                    "state": "CA",
                    "zipcode": 94041,
                    "zone": 3
                ],
                [
                    "initial": "SNYV",
                    "name": "Sunnyvale",
                    "gtfs_latitude": 37.378789,
                    "gtfs_longitude": -122.031423,
                    "address": "121 W. Evelyn Avenue",
                    "city": "Sunnyvale",
                    "state": "CA",
                    "zipcode": 94086,
                    "zone": 3
                ],
                [
                    "initial": "LWRN",
                    "name": "Lawrence",
                    "gtfs_latitude": 37.370484,
                    "gtfs_longitude": -121.997135,
                    "address": "137 San Zeno Way",
                    "city": "Sunnyvale",
                    "state": "CA",
                    "zipcode": 94086,
                    "zone": 4
                ],
                [
                    "initial": "STCL",
                    "name": "Santa Clara",
                    "gtfs_latitude": 37.353189,
                    "gtfs_longitude": -121.936135,
                    "address": "1001 Railroad Avenue",
                    "city": "Santa Clara",
                    "state": "CA",
                    "zipcode": 95050,
                    "zone": 4
                ],
                [
                    "initial": "CLGP",
                    "name": "College Park",
                    "gtfs_latitude": 37.342338,
                    "gtfs_longitude": -121.914677,
                    "address": "780 Stockton Avenue",
                    "city": "San Jose",
                    "state": "CA",
                    "zipcode": 95126,
                    "zone": 4
                ],
                [
                    "initial": "SJSD",
                    "name": "San Jose Diridon",
                    "gtfs_latitude": 37.329231,
                    "gtfs_longitude": -121.903173,
                    "address": "65 Cahill Street",
                    "city": "San Jose",
                    "state": "CA",
                    "zipcode": 95110,
                    "zone": 4
                ],
                [
                    "initial": "TAMN",
                    "name": "Tamien",
                    "gtfs_latitude": 37.31175,
                    "gtfs_longitude": -121.883999,
                    "address": "1355 Lick Avenue",
                    "city": "San Jose",
                    "state": "CA",
                    "zipcode": 95110,
                    "zone": 4
                ],
                [
                    "initial": "CAPT",
                    "name": "Capitol",
                    "gtfs_latitude": 37.284062,
                    "gtfs_longitude": -121.842037,
                    "address": "3400 Monterey Hwy",
                    "city": "San Jose",
                    "state": "CA",
                    "zipcode": 95111,
                    "zone": 5
                ],
                [
                    "initial": "BLSH",
                    "name": "Blossom Hill",
                    "gtfs_latitude": 37.252379,
                    "gtfs_longitude": -121.797683,
                    "address": "5560 Monterey Hwy",
                    "city": "San Jose",
                    "state": "CA",
                    "zipcode": 95138,
                    "zone": 5
                ],
                [
                    "initial": "MRGH",
                    "name": "Morgan Hill",
                    "gtfs_latitude": 37.129321,
                    "gtfs_longitude": -121.650304,
                    "address": "17300 Depot Street",
                    "city": "Morgan Hill",
                    "state": "CA",
                    "zipcode": 95037,
                    "zone": 6
                ],
                [
                    "initial": "SMRT",
                    "name": "San Martin",
                    "gtfs_latitude": 37.086653,
                    "gtfs_longitude": -121.610936,
                    "address": "13400 Monterey Hwy",
                    "city": "San Martin",
                    "state": "CA",
                    "zipcode": 95046,
                    "zone": 6
                ],
                [
                    "initial": "GLRY",
                    "name": "Gilroy",
                    "gtfs_latitude": 37.003485,
                    "gtfs_longitude": -121.566225,
                    "address": "7150 Monterey Street",
                    "city": "Gilroy",
                    "state": "CA",
                    "zipcode": 95020,
                    "zone": 6
                ]
            ]
        
        var caltrainStationArray = [CaltrainStation]()
        
        for i in caltrainStationData {
            caltrainStationArray.append(CaltrainStation(dictionary: i as [String:AnyObject]))
        }
        return caltrainStationArray
    }
    
    static var sanfrancisco = CaltrainStation.all[0]
    static var twentysecondstreet = CaltrainStation.all[1]
    static var bayshore = CaltrainStation.all[2]
    static var southsanfrancisco = CaltrainStation.all[3]
    static var sanbruno = CaltrainStation.all[4]
    static var millbrae = CaltrainStation.all[5]
    static var broadway = CaltrainStation.all[6]
    static var burlingame = CaltrainStation.all[7]
    static var sanmateo = CaltrainStation.all[8]
    static var hayward = CaltrainStation.all[9]
    static var hillsdale = CaltrainStation.all[10]
    static var belmont = CaltrainStation.all[11]
    static var sancarlos = CaltrainStation.all[12]
    static var redwoodcity = CaltrainStation.all[13]
    static var atherton = CaltrainStation.all[14]
    static var menlopark = CaltrainStation.all[15]
    static var paloalto = CaltrainStation.all[16]
    static var californiaavenue = CaltrainStation.all[17]
    static var sanantonio = CaltrainStation.all[18]
    static var mountainview = CaltrainStation.all[19]
    static var sunnyvale = CaltrainStation.all[20]
    static var lawrence = CaltrainStation.all[21]
    static var santaclara = CaltrainStation.all[22]
    static var collegepark = CaltrainStation.all[23]
    static var sanjosediridon = CaltrainStation.all[24]
    static var tamien = CaltrainStation.all[25]
    static var capitol = CaltrainStation.all[26]
    static var blossomhill = CaltrainStation.all[27]
    static var morganhill = CaltrainStation.all[28]
    static var sanmartin = CaltrainStation.all[29]
    static var gilroy = CaltrainStation.all[30]
}

