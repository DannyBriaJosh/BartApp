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
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        
        let originStation = userInput.startStation?.initial
        let destinationStation = userInput.endStation?.initial
        let timeString = userInput.timeString ?? "now"
        let scheduleFormat = userInput.scheduleFormat ?? "depart"
        
        
        
        BartClient.sharedInstance.grabRoutes(cmd: scheduleFormat, origin: originStation!, destination: destinationStation!, date: "today", time: timeString, success: { (trips: [Trip]) -> () in
            self.trips = trips
          //  print("trips: \(self.trips)")
            self.tableView.reloadData()
            
        }, failure: { (error: Error) -> () in
            //
        })
        
        tableView.delegate = self
        tableView.dataSource = self
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

extension RoutesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let trip = trips[section]
        return trip.legs!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "TripStationCell") as! TripStationCell
        let legs = trips[indexPath.section].legs
        let leg = legs?[indexPath.row]
        
//        cell.leg = leg
//        cell.selectionStyle = .none
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LegTableViewCell", for: indexPath) as! LegTableViewCell
        cell.leg = leg
        if indexPath.row == 0 {
            cell.place = "first"
        } else if indexPath.row == (legs?.count)! - 1 {
            cell.place = "last"
        } else {
            cell.place = "middle"
        }
        
        if legs?.count == 1 {
            cell.place = "single"
        }
        
        return cell
        
        
//        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let trip = trips[indexPath.section]
        if let legs = trip.legs {
            let vc = storyboard?.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
            vc.legs = legs
            vc.trip = trip
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return trips.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Trip \(section + 1)"
    }
}
