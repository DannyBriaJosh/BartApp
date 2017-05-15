//
//  TwitterClient.swift
//  DGTwitter
//
//  Created by Danny Glover on 4/13/17.
//  Copyright © 2017 Danny Glover. All rights reserved.
//

import UIKit
import Alamofire
import SWXMLHash

class BartClient {
    
    static let sharedInstance = BartClient()
    
    let baseURLString = "https://api.bart.gov/api/sched.aspx?key=MW9S-E7SL-26DU-VV8V"

    // sample route http://api.bart.gov/api/sched.aspx?cmd=depart&orig=ASHB&dest=CIVC&date=now&key=MW9S-E7SL-26DU-VV8V&b=2&a=2&l=1
    
    func grabRoutes(cmd: String, origin: String, destination: String, date: String, time: String, success: @escaping ([Trip]) -> (), failure: @escaping (Error) -> ()){
        
        let urlString = baseURLString + "&cmd=\(cmd)" + "&orig=\(origin)" + "&dest=\(destination)" + "&date=\(date)" + "&time=\(time)" + "&a=4" + "&b=0"

        
        print(urlString)
        Alamofire.request(urlString).responseData { response in
        
            if let data = response.result.value, let utf8Text = String(data: data, encoding: .utf8) {
                let xml = SWXMLHash.parse(data)
                var trips = [Trip]()
                for tripData in xml["root"]["schedule"]["request"]["trip"] {
                    
                    var trip = Trip()
                    var legs = [Leg]()
                    trip.origin = tripData.element?.attribute(by: "origin")?.text
                    trip.destination = tripData.element?.attribute(by: "destination")?.text
                    trip.fare = tripData.element?.attribute(by: "fare")?.text
                    trip.departureTime = tripData.element?.attribute(by: "origTimeMin")?.text
                    trip.arrivalTime = tripData.element?.attribute(by: "destTimeMin")?.text
                    
                    for legData in tripData["leg"] {
                        var leg = Leg()
                        leg.origin = legData.element?.attribute(by: "origin")?.text
                        leg.destination = legData.element?.attribute(by: "destination")?.text
                        leg.arriveTime = legData.element?.attribute(by: "destTimeMin")?.text
                        leg.departTime = legData.element?.attribute(by: "origTimeMin")?.text
                        leg.line = legData.element?.attribute(by: "line")?.text
                        leg.order = Int((legData.element?.attribute(by: "order")?.text)!)
                        legs.append(leg)
                    }
                    trip.legs = legs
                    trips.append(trip)
                    
                }
                success(trips)
            }
        }
    
    }
}
