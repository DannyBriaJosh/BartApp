//
//  BartRouteInputViewController.swift
//  BartApp
//
//  Created by Bria Wallace on 4/25/17.
//  Copyright © 2017 Bria Wallace. All rights reserved.
//

import UIKit

class BartRouteInputViewController: UIViewController, ChooseBartStationDelegate {

    @IBOutlet var bartRouteInputView: BartRouteInputView!
    
    var arrival = false
    var departure = true
    var time: Date!
    var trip = TripRequest()
    
    func setStartingStation(chooseBartStationViewController: ChooseBartStationViewController, didSetStartingStation startingStation: BartStation) {
        bartRouteInputView.setStartingStation(startingStation: startingStation)
        trip.startStation = startingStation
    }
    
    func setEndingStation(chooseBartStationViewController: ChooseBartStationViewController, didSetEndingStation endingStation: BartStation) {
        bartRouteInputView.setEndingStation(endingStation: endingStation)
        trip.endStation = endingStation
    }
    
    @IBAction func onDepartureButton(_ sender: Any) {
        bartRouteInputView.onDepartureButton()
        departure = true
        arrival = false
    }
    
    @IBAction func onArrivalButton(_ sender: Any) {
        bartRouteInputView.onArrivalButton()
        departure = false
        arrival = true
    }
    
    @IBAction func onStartingTimeButton(_ sender: Any) {
        bartRouteInputView.onStartingTimeButton()
    }
    
    @IBAction func onDoneButton(_ sender: Any) {
        bartRouteInputView.onDoneButton()
        time = bartRouteInputView.timePicker.date
    }
    
    @IBAction func onSwitchStartEndStationButton(_ sender: Any) {
        let previousStart = trip.startStation
        let previousEnd = trip.endStation
        if previousEnd != nil {
            bartRouteInputView.setStartingStation(startingStation: previousEnd!)
            trip.startStation = previousEnd
        } else if previousStart != nil {
            bartRouteInputView.clearStartingStation()
            trip.startStation = nil
        }
        if previousStart != nil {
            bartRouteInputView.setEndingStation(endingStation: previousStart!)
            trip.endStation = previousStart
        } else if previousEnd != nil {
            bartRouteInputView.clearEndingStation()
            trip.endStation = nil
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectStartingStationSegue" {
            let vc = segue.destination as! ChooseBartStationViewController
            vc.starting = true
            vc.otherSelectedStation = trip.endStation
            vc.delegate = self
        } else if segue.identifier == "SelectEndingStationSegue" {
            let vc = segue.destination as! ChooseBartStationViewController
            vc.ending = true
            vc.otherSelectedStation = trip.startStation
            vc.delegate = self
        } else if segue.identifier == "FindRoutesSegue" {
            let vc = segue.destination as! RoutesViewController
            if arrival {
                trip.arrivalTime = time
            }
            if departure {
                trip.departureTime = time
            }
            print(trip)
            vc.userInput = trip
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bartRouteInputView.onLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
