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
    var trainSystem = "Bart"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        tableView.separatorStyle = .none
        let origin = userInput.startStation? as! BartStation
        if trainSystem == "Caltrain" {
            origin = userInput.startStation? as! CaltrainStation
        }
        let originStation = origin.initial
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
        return trip.legs!.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let legs = trips[indexPath.section].legs
        let cell = tableView.dequeueReusableCell(withIdentifier: "LegTableViewCell", for: indexPath) as! LegTableViewCell
        cell.selectionStyle = .none
        
        if indexPath.row >= (legs?.count)! {
            cell.isLast = true
            cell.leg = legs?[indexPath.row  - 1]
            
        } else {
            cell.leg = legs?[indexPath.row]
        }
        
        if indexPath.row == 0 {
            cell.place = "first"
        } else {
            cell.prevLeg = legs?[indexPath.row - 1] // Used to color train lines
            if indexPath.row == (legs?.count)! {
                cell.place = "last"
            } else {
                cell.place = "middle"
            }
        }
        
        
        return cell
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
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return "Trip \(section + 1)"
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)?.first as! HeaderView
        
        let trip = trips[section]
        print("trip: \(trip)")
        
        if trip.scheduleType == "arrive" {
            headerView.timeLabel.text = "Arriving \(trip.arrivalTime!)"
        } else {
            headerView.timeLabel.text = "Departing \(trip.departureTime!)"
        }
        
        
        headerView.tripNumberLabel.text = "Trip \(section + 1)"
        
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 62
    }
    
    
}
