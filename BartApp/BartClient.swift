//
//  TwitterClient.swift
//  DGTwitter
//
//  Created by Danny Glover on 4/13/17.
//  Copyright © 2017 Danny Glover. All rights reserved.
//

import UIKit
import AFNetworking
import Alamofire
import SWXMLHash

class BartClient {
    
    static let sharedInstance = BartClient()
    
    let baseURL = URL(string:"https://api.bart.gov/api/sched.aspx?key=Q5ZB-5AYQ-9N9T-DWE9")

    // sample route http://api.bart.gov/api/sched.aspx?cmd=depart&orig=ASHB&dest=CIVC&date=now&key=MW9S-E7SL-26DU-VV8V&b=2&a=2&l=1
    
    func grabRoute(){
        
        Alamofire.request("https://api.bart.gov/api/sched.aspx?cmd=depart&orig=ASHB&dest=CIVC&date=now&key=MW9S-E7SL-26DU-VV8V&b=2&a=2&l=1").responseData { response in
            debugPrint("All Response Info: \(response)")
            
            
            if let data = response.result.value, let utf8Text = String(data: data, encoding: .utf8) {
//                print("Data: \(utf8Text)")
                let xml = SWXMLHash.parse(data)
                print("xml: \(xml)")
            }
        }
    
    }
}
