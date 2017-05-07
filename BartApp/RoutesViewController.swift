//
//  RoutesViewController.swift
//  BartApp
//
//  Created by Bria Wallace on 4/26/17.
//  Copyright © 2017 Bria Wallace. All rights reserved.
//

import UIKit

class RoutesViewController: UIViewController {
    
    var userInput: TripRequest!
    var trips = [Trip]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let originStation = userInput.startStation?.initial
        let destinationStation = userInput.endStation?.initial
        
        print(originStation)
        print(destinationStation)
        
        
        BartClient.sharedInstance.grabRoutes(cmd: "depart", origin: originStation!, destination: destinationStation!, date: "now", success: { (trips: [Trip]) -> () in
            self.trips = trips
            print("trips: \(self.trips)")
            
//            self.tweetsTableView.reloadData()
            
        }, failure: { (error: Error) -> () in
            //
        })
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
