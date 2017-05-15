//
//  RouteInputViewController.swift
//  BartApp
//
//  Created by Bria Wallace on 4/25/17.
//  Copyright © 2017 Bria Wallace. All rights reserved.
//

import UIKit

class RouteInputViewController: UIViewController, ChooseStationDelegate {

    @IBOutlet var routeInputView: RouteInputView!
    
    var arrival = false
    var departure = true
    var time: Date!
    var trip = TripRequest()
    
    func setStartingStation(chooseStationViewController: ChooseStationViewController, didSetStartingStation startingStation: BartStation) {
        routeInputView.setStartingStation(startingStation: startingStation)
        trip.startStation = startingStation
    }
    
    func setEndingStation(chooseStationViewController: ChooseStationViewController, didSetEndingStation endingStation: BartStation) {
        routeInputView.setEndingStation(endingStation: endingStation)
        trip.endStation = endingStation
    }
    
    @IBAction func onDepartureButton(_ sender: Any) {
        routeInputView.onDepartureButton()
        departure = true
        arrival = false
    }
    
    @IBAction func onArrivalButton(_ sender: Any) {
        routeInputView.onArrivalButton()
        departure = false
        arrival = true
    }
    
    @IBAction func onStartingTimeButton(_ sender: Any) {
        routeInputView.onStartingTimeButton()
    }
    
    @IBAction func onDoneButton(_ sender: Any) {
        routeInputView.onDoneButton()
        time = routeInputView.timePicker.date
    }
    
    @IBAction func onSwitchStartEndStationButton(_ sender: Any) {
        let previousStart = trip.startStation
        let previousEnd = trip.endStation
        if previousEnd != nil {
            routeInputView.setStartingStation(startingStation: previousEnd!)
            trip.startStation = previousEnd
        } else if previousStart != nil {
            routeInputView.clearStartingStation()
            trip.startStation = nil
        }
        if previousStart != nil {
            routeInputView.setEndingStation(endingStation: previousStart!)
            trip.endStation = previousStart
        } else if previousEnd != nil {
            routeInputView.clearEndingStation()
            trip.endStation = nil
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectStartingStationSegue" {
            let vc = segue.destination as! ChooseStationViewController
            vc.starting = true
            vc.otherSelectedStation = trip.endStation
            vc.delegate = self
        } else if segue.identifier == "SelectEndingStationSegue" {
            let vc = segue.destination as! ChooseStationViewController
            vc.ending = true
            vc.otherSelectedStation = trip.startStation
            vc.delegate = self
        } else if segue.identifier == "FindRoutesSegue" {
            let vc = segue.destination as! RoutesViewController
            trip.arrivalTime = nil
            trip.departureTime = nil
            if arrival {
                trip.scheduleFormat = "arrive"
                trip.arrivalTime = time
            }
            if departure {
                trip.scheduleFormat = "depart"
                trip.departureTime = time
                
            }
//            print(trip)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mma"
            trip.timeString = dateFormatter.string(from: time)
            print("time string: \(dateFormatter.string(from: time))")
            vc.userInput = trip
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        routeInputView.onLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
