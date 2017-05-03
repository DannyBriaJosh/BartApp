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
    
    func grabRoute(cmd: String, origin: String, destination: String, date: String){
        
        let urlString = baseURLString + "&cmd=\(cmd)" + "&orig=\(origin)" + "&dest=\(destination)" + "&date=\(date)"
        
        print(urlString)
        Alamofire.request(urlString).responseData { response in
            debugPrint("All Response Info: \(response)")
            
            
            if let data = response.result.value, let utf8Text = String(data: data, encoding: .utf8) {
//                print("Data: \(utf8Text)")
                let xml = SWXMLHash.parse(data)
//                print("xml: \(xml)")
                
                for trip in xml["root"]["schedule"]["request"]["trip"] {
                    
                    print("trip: ")
                    print(trip.element?.attribute(by: "fare")?.text)
                    print("leg: ")
                    print(trip["leg"])
                
                }
//                print("xml[root]: \(xml["root"]["schedule"]["request"]["trip"])")
            }
        }
    
    }
}
