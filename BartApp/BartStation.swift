//
//  BartStation.swift
//  BartApp
//
//  Created by Bria Wallace on 4/25/17.
//  Copyright © 2017 Bria Wallace. All rights reserved.
//

import Foundation
import CoreLocation

struct BartStation {
    var initial: String?
    var name: String?
    var gtfsLatitude: Double?
    var gtfsLongitude: Double?
    var address: String?
    var city: String?
    var county: String?
    var state: String?
    var zipcode: Int?
    var stationCoordinate: CLLocationCoordinate2D?
    
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
        
        if let county = dictionary["county"] as? String {
            self.county = county
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
    }
}



extension BartStation {
    
    static var all: [BartStation] {
        
        let bartStationData =
            [
                [
                    "initial": "12TH",
                    "name": "12th St. Oakland City Center",
                    "gtfs_latitude": 37.803664,
                    "gtfs_longitude": -122.271604,
                    "address": "1245 Broadway",
                    "city": "Oakland",
                    "county": "alameda",
                    "state": "CA",
                    "zipcode": 94612
                ],
                [
                    "initial": "16TH",
                    "name": "16th St. Mission",
                    "gtfs_latitude": 37.765062,
                    "gtfs_longitude": -122.419694,
                    "address": "2000 Mission Street",
                    "city": "San Francisco",
                    "county": "sanfrancisco",
                    "state": "CA",
                    "zipcode": 94110
                ],
                [
                    "initial": "19TH",
                    "name": "19th St. Oakland",
                    "gtfs_latitude": 37.80787,
                    "gtfs_longitude": -122.269029,
                    "address": "1900 Broadway",
                    "city": "Oakland",
                    "county": "alameda",
                    "state": "CA",
                    "zipcode": 94612
                ],
                [
                    "initial": "24TH",
                    "name": "24th St. Mission",
                    "gtfs_latitude": 37.752254,
                    "gtfs_longitude": -122.418466,
                    "address": "2800 Mission Street",
                    "city": "San Francisco",
                    "county": "sanfrancisco",
                    "state": "CA",
                    "zipcode": 94110
                ],
                [
                    "initial": "ASHB",
                    "name": "Ashby",
                    "gtfs_latitude": 37.853024,
                    "gtfs_longitude": -122.26978,
                    "address": "3100 Adeline Street",
                    "city": "Berkeley",
                    "county": "alameda",
                    "state": "CA",
                    "zipcode": 94703
                ],
                [
                    "initial": "BALB",
                    "name": "Balboa Park",
                    "gtfs_latitude": 37.72198087,
                    "gtfs_longitude": -122.4474142,
                    "address": "401 Geneva Avenue",
                    "city": "San Francisco",
                    "county": "sanfrancisco",
                    "state": "CA",
                    "zipcode": 94112
                ],
                [
                    "initial": "BAYF",
                    "name": "Bay Fair",
                    "gtfs_latitude": 37.697185,
                    "gtfs_longitude": -122.126871,
                    "address": "15242 Hesperian Blvd.",
                    "city": "San Leandro",
                    "county": "alameda",
                    "state": "CA",
                    "zipcode": 94578
                ],
                [
                    "initial": "CAST",
                    "name": "Castro Valley",
                    "gtfs_latitude": 37.690754,
                    "gtfs_longitude": -122.075567,
                    "address": "3301 Norbridge Dr.",
                    "city": "Castro Valley",
                    "county": "alameda",
                    "state": "CA",
                    "zipcode": 94546
                ],
                [
                    "initial": "CIVC",
                    "name": "Civic Center/UN Plaza",
                    "gtfs_latitude": 37.779528,
                    "gtfs_longitude": -122.413756,
                    "address": "1150 Market Street",
                    "city": "San Francisco",
                    "county": "sanfrancisco",
                    "state": "CA",
                    "zipcode": 94102
                ],
                [
                    "initial": "COLS",
                    "name": "Coliseum/Oakland Airport",
                    "gtfs_latitude": 37.754006,
                    "gtfs_longitude": -122.197273,
                    "address": "7200 San Leandro St.",
                    "city": "Oakland",
                    "county": "alameda",
                    "state": "CA",
                    "zipcode": 94621
                ],
                [
                    "initial": "COLM",
                    "name": "Colma",
                    "gtfs_latitude": 37.684638,
                    "gtfs_longitude": -122.466233,
                    "address": "365 D Street",
                    "city": "Colma",
                    "county": "sanmateo",
                    "state": "CA",
                    "zipcode": 94014
                ],
                [
                    "initial": "CONC",
                    "name": "Concord",
                    "gtfs_latitude": 37.973737,
                    "gtfs_longitude": -122.029095,
                    "address": "1451 Oakland Avenue",
                    "city": "Concord",
                    "county": "contracosta",
                    "state": "CA",
                    "zipcode": 94520
                ],
                [
                    "initial": "DALY",
                    "name": "Daly City",
                    "gtfs_latitude": 37.70612055,
                    "gtfs_longitude": -122.4690807,
                    "address": "500 John Daly Blvd.",
                    "city": "Daly City",
                    "county": "sanmateo",
                    "state": "CA",
                    "zipcode": 94014
                ],
                [
                    "initial": "DBRK",
                    "name": "Downtown Berkeley",
                    "gtfs_latitude": 37.869867,
                    "gtfs_longitude": -122.268045,
                    "address": "2160 Shattuck Avenue",
                    "city": "Berkeley",
                    "county": "alameda",
                    "state": "CA",
                    "zipcode": 94704
                ],
                [
                    "initial": "DUBL",
                    "name": "Dublin/Pleasanton",
                    "gtfs_latitude": 37.701695,
                    "gtfs_longitude": -121.900367,
                    "address": "5801 Owens Dr.",
                    "city": "Pleasanton",
                    "county": "alameda",
                    "state": "CA",
                    "zipcode": 94588
                ],
                [
                    "initial": "DELN",
                    "name": "El Cerrito del Norte",
                    "gtfs_latitude": 37.925655,
                    "gtfs_longitude": -122.317269,
                    "address": "6400 Cutting Blvd.",
                    "city": "El Cerrito",
                    "county": "contracosta",
                    "state": "CA",
                    "zipcode": 94530
                ],
                [
                    "initial": "PLZA",
                    "name": "El Cerrito Plaza",
                    "gtfs_latitude": 37.9030588,
                    "gtfs_longitude": -122.2992715,
                    "address": "6699 Fairmount Avenue",
                    "city": "El Cerrito",
                    "county": "contracosta",
                    "state": "CA",
                    "zipcode": 94530
                ],
                [
                    "initial": "EMBR",
                    "name": "Embarcadero",
                    "gtfs_latitude": 37.792976,
                    "gtfs_longitude": -122.396742,
                    "address": "298 Market Street",
                    "city": "San Francisco",
                    "county": "sanfrancisco",
                    "state": "CA",
                    "zipcode": 94111
                ],
                [
                    "initial": "FRMT",
                    "name": "Fremont",
                    "gtfs_latitude": 37.557355,
                    "gtfs_longitude": -121.9764,
                    "address": "2000 BART Way",
                    "city": "Fremont",
                    "county": "alameda",
                    "state": "CA",
                    "zipcode": 94536
                ],
                [
                    "initial": "FTVL",
                    "name": "Fruitvale",
                    "gtfs_latitude": 37.774963,
                    "gtfs_longitude": -122.224274,
                    "address": "3401 East 12th Street",
                    "city": "Oakland",
                    "county": "alameda",
                    "state": "CA",
                    "zipcode": 94601
                ],
                [
                    "initial": "GLEN",
                    "name": "Glen Park",
                    "gtfs_latitude": 37.732921,
                    "gtfs_longitude": -122.434092,
                    "address": "2901 Diamond Street",
                    "city": "San Francisco",
                    "county": "sanfrancisco",
                    "state": "CA",
                    "zipcode": 94131
                ],
                [
                    "initial": "HAYW",
                    "name": "Hayward",
                    "gtfs_latitude": 37.670399,
                    "gtfs_longitude": -122.087967,
                    "address": "699 \"B\" Street",
                    "city": "Hayward",
                    "county": "alameda",
                    "state": "CA",
                    "zipcode": 94541
                ],
                [
                    "initial": "LAFY",
                    "name": "Lafayette",
                    "gtfs_latitude": 37.893394,
                    "gtfs_longitude": -122.123801,
                    "address": "3601 Deer Hill Road",
                    "city": "Lafayette",
                    "county": "contracosta",
                    "state": "CA",
                    "zipcode": 94549
                ],
                [
                    "initial": "LAKE",
                    "name": "Lake Merritt",
                    "gtfs_latitude": 37.797484,
                    "gtfs_longitude": -122.265609,
                    "address": "800 Madison Street",
                    "city": "Oakland",
                    "county": "alameda",
                    "state": "CA",
                    "zipcode": 94607
                ],
                [
                    "initial": "MCAR",
                    "name": "MacArthur",
                    "gtfs_latitude": 37.828415,
                    "gtfs_longitude": -122.267227,
                    "address": "555 40th Street",
                    "city": "Oakland",
                    "county": "alameda",
                    "state": "CA",
                    "zipcode": 94609
                ],
                [
                    "initial": "MLBR",
                    "name": "Millbrae",
                    "gtfs_latitude": 37.599787,
                    "gtfs_longitude": -122.38666,
                    "address": "200 North Rollins Road",
                    "city": "Millbrae",
                    "county": "sanmateo",
                    "state": "CA",
                    "zipcode": 94030
                ],
                [
                    "initial": "MONT",
                    "name": "Montgomery St.",
                    "gtfs_latitude": 37.789256,
                    "gtfs_longitude": -122.401407,
                    "address": "598 Market Street",
                    "city": "San Francisco",
                    "county": "sanfrancisco",
                    "state": "CA",
                    "zipcode": 94104
                ],
                [
                    "initial": "NBRK",
                    "name": "North Berkeley",
                    "gtfs_latitude": 37.87404,
                    "gtfs_longitude": -122.283451,
                    "address": "1750 Sacramento Street",
                    "city": "Berkeley",
                    "county": "alameda",
                    "state": "CA",
                    "zipcode": 94702
                ],
                [
                    "initial": "NCON",
                    "name": "North Concord/Martinez",
                    "gtfs_latitude": 38.003275,
                    "gtfs_longitude": -122.024597,
                    "address": "3700 Port Chicago Highway",
                    "city": "Concord",
                    "county": "contracosta",
                    "state": "CA",
                    "zipcode": 94520
                ],
                [
                    "initial": "OAKL",
                    "name": "Oakland Int\"l Airport",
                    "gtfs_latitude": 37.71297174,
                    "gtfs_longitude": -122.21244024,
                    "address": "4 Airport Drive",
                    "city": "Oakland",
                    "county": "alameda",
                    "state": "CA",
                    "zipcode": 94621
                ],
                [
                    "initial": "ORIN",
                    "name": "Orinda",
                    "gtfs_latitude": 37.87836087,
                    "gtfs_longitude": -122.1837911,
                    "address": "11 Camino Pablo",
                    "city": "Orinda",
                    "county": "contracosta",
                    "state": "CA",
                    "zipcode": 94563
                ],
                [
                    "initial": "PITT",
                    "name": "Pittsburg/Bay Point",
                    "gtfs_latitude": 38.018914,
                    "gtfs_longitude": -121.945154,
                    "address": "1700 West Leland Road",
                    "city": "Pittsburg",
                    "county": "contracosta",
                    "state": "CA",
                    "zipcode": 94565
                ],
                [
                    "initial": "PHIL",
                    "name": "Pleasant Hill/Contra Costa Centre",
                    "gtfs_latitude": 37.928403,
                    "gtfs_longitude": -122.056013,
                    "address": "1365 Treat Blvd.",
                    "city": "Walnut Creek",
                    "county": "contracosta",
                    "state": "CA",
                    "zipcode": 94597
                ],
                [
                    "initial": "POWL",
                    "name": "Powell St.",
                    "gtfs_latitude": 37.784991,
                    "gtfs_longitude": -122.406857,
                    "address": "899 Market Street",
                    "city": "San Francisco",
                    "county": "sanfrancisco",
                    "state": "CA",
                    "zipcode": 94102
                ],
                [
                    "initial": "RICH",
                    "name": "Richmond",
                    "gtfs_latitude": 37.936887,
                    "gtfs_longitude": -122.353165,
                    "address": "1700 Nevin Avenue",
                    "city": "Richmond",
                    "county": "contracosta",
                    "state": "CA",
                    "zipcode": 94801
                ],
                [
                    "initial": "ROCK",
                    "name": "Rockridge",
                    "gtfs_latitude": 37.844601,
                    "gtfs_longitude": -122.251793,
                    "address": "5660 College Avenue",
                    "city": "Oakland",
                    "county": "alameda",
                    "state": "CA",
                    "zipcode": 94618
                ],
                [
                    "initial": "SBRN",
                    "name": "San Bruno",
                    "gtfs_latitude": 37.637753,
                    "gtfs_longitude": -122.416038,
                    "address": "1151 Huntington Avenue",
                    "city": "San Bruno",
                    "county": "sanmateo",
                    "state": "CA",
                    "zipcode": 94066
                ],
                [
                    "initial": "SFIA",
                    "name": "San Francisco Int\"l Airport",
                    "gtfs_latitude": 37.616035,
                    "gtfs_longitude": -122.392612,
                    "address": "International Terminal, Level 3",
                    "city": "San Francisco Int\"l Airport",
                    "county": "sanmateo",
                    "state": "CA",
                    "zipcode": 94128
                ],
                [
                    "initial": "SANL",
                    "name": "San Leandro",
                    "gtfs_latitude": 37.72261921,
                    "gtfs_longitude": -122.1613112,
                    "address": "1401 San Leandro Blvd.",
                    "city": "San Leandro",
                    "county": "alameda",
                    "state": "CA",
                    "zipcode": 94577
                ],
                [
                    "initial": "SHAY",
                    "name": "South Hayward",
                    "gtfs_latitude": 37.63479954,
                    "gtfs_longitude": -122.0575506,
                    "address": "28601 Dixon Street",
                    "city": "Hayward",
                    "county": "alameda",
                    "state": "CA",
                    "zipcode": 94544
                ],
                [
                    "initial": "SSAN",
                    "name": "South San Francisco",
                    "gtfs_latitude": 37.664174,
                    "gtfs_longitude": -122.444116,
                    "address": "1333 Mission Road",
                    "city": "South San Francisco",
                    "county": "sanmateo",
                    "state": "CA",
                    "zipcode": 94080
                ],
                [
                    "initial": "UCTY",
                    "name": "Union City",
                    "gtfs_latitude": 37.591208,
                    "gtfs_longitude": -122.017867,
                    "address": "10 Union Square",
                    "city": "Union City",
                    "county": "alameda",
                    "state": "CA",
                    "zipcode": 94587
                ],
                [
                    "initial": "WCRK",
                    "name": "Walnut Creek",
                    "gtfs_latitude": 37.905628,
                    "gtfs_longitude": -122.067423,
                    "address": "200 Ygnacio Valley Road",
                    "city": "Walnut Creek",
                    "county": "contracosta",
                    "state": "CA",
                    "zipcode": 94596
                ],
                [
                    "initial": "WDUB",
                    "name": "West Dublin/Pleasanton",
                    "gtfs_latitude": 37.699759,
                    "gtfs_longitude": -121.928099,
                    "address": "6501 Golden Gate Drive",
                    "city": "Dublin",
                    "county": "alameda",
                    "state": "CA",
                    "zipcode": 94568
                ],
                [
                    "initial": "WOAK",
                    "name": "West Oakland",
                    "gtfs_latitude": 37.80467476,
                    "gtfs_longitude": -122.2945822,
                    "address": "1451 7th Street",
                    "city": "Oakland",
                    "county": "alameda",
                    "state": "CA",
                    "zipcode": 94607
                ]
        ]
        
        var bartStationArray = [BartStation]()
        
        for i in bartStationData {
            bartStationArray.append(BartStation(dictionary: i as [String : AnyObject]))
        }
        return bartStationArray
    }
    
}
