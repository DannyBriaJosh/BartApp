//
//  RouteInputViewController.swift
//  BartApp
//
//  Created by Bria Wallace on 4/25/17.
//  Copyright © 2017 Bria Wallace. All rights reserved.
//

import UIKit

class RouteInputViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var routeInputView: RouteInputView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var caltrainSystemButton: UIButton!
    @IBOutlet weak var bartSystemButton: UIButton!
    
    
    var arrival = false
    var departure = true
    var time = Date()
    var trip = TripRequest()
    var bartStations: [BartStation]! = []
    var starting = false
    var ending = false
    var homeStation: BartStation?
    var workStation: BartStation?
    var system = "Bart"
    
    @IBAction func onStartStationButton(_ sender: Any) {
        starting = true
        ending = false
        tableView.reloadData()
        routeInputView.showStationView()
    }
    
    @IBAction func onEndStationButton(_ sender: Any) {
        starting = false
        ending = true
        tableView.reloadData()
        routeInputView.showStationView()
    }
    
    @IBAction func onCaltrainSystemButton(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.setValue("Caltrain", forKey: "trainSystem")
        routeInputView.onCaltrainSystemButton()
        system = "Caltrain"
        resetView()
    }
    
    @IBAction func onBartSystemButton(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.setValue("Bart", forKey: "trainSystem")
        routeInputView.onBartSystemButton()
        system = "Bart"
        resetView()
    }
    
    func setStartingStation(chooseStationViewController: ChooseStationViewController, didSetStartingStation startingStation: BartStation) {
        routeInputView.setStartingStation(startingStation: startingStation)
        trip.startStation = startingStation
    }
    
    func setEndingStation(chooseStationViewController: ChooseStationViewController, didSetEndingStation endingStation: BartStation) {
        routeInputView.setEndingStation(endingStation: endingStation)
        trip.endStation = endingStation
    }
    
    @IBAction func onLeaveNowButton(_ sender: Any) {
        routeInputView.onLeaveNowButton()
        departure = true
        arrival = false
    }
    
    func resetView() { //will be used once transportation type changes
        Style.loadTheme()
        routeInputView.clearStartingStation()
        routeInputView.clearEndingStation()
        routeInputView.updateStyle()
        routeInputView.onLeaveNowButton()
        routeInputView.setNavigationBar(trainSystem: system)
        trip.startStation = nil
        trip.endStation = nil
    }
    
    @IBAction func onDepartureButton(_ sender: Any) {
        loadHomeWorkStations()
        routeInputView.onDepartureButton()
        departure = true
        arrival = false
        routeInputView.onStartingTimeButton()
    }
    
    @IBAction func onArrivalButton(_ sender: Any) {
        loadHomeWorkStations()
        routeInputView.onArrivalButton()
        departure = false
        arrival = true
        routeInputView.onStartingTimeButton()
    }
    
    @IBAction func onSwitchStartEndStationButton(_ sender: Any) {
        let previousStart = trip.startStation
        let previousEnd = trip.endStation
        if previousEnd != nil {
            if system == "Bart" {
                routeInputView.setStartingStation(startingStation: previousEnd! as! BartStation)
            } else if system == "Caltrain" {
                routeInputView.setStartingStation(startingStation: previousEnd! as! CaltrainStation)
            }
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
    
    func loadHomeWorkStations() {
        let defaults = UserDefaults.standard
        
        if let homeStationIndex = defaults.value(forKey: "Home") as? Int {
            homeStation = bartStations[homeStationIndex]
        }
        if let workStationIndex = defaults.value(forKey: "Work") as? Int {
            workStation = bartStations[workStationIndex]
        }
        var copyBartStations = bartStations!
        var newBartStationsArray = [BartStation]()
        if homeStation != nil {
            newBartStationsArray += [homeStation!]
        }
        if workStation != nil {
            newBartStationsArray += [workStation!]
        }
        for (index,station) in copyBartStations.enumerated() {
            if station.initial == homeStation?.initial {
                copyBartStations.remove(at: index)
            }
        }
        for (index,station) in copyBartStations.enumerated() {
            if station.initial == workStation?.initial {
                copyBartStations.remove(at: index)
            }
        }
        newBartStationsArray += copyBartStations
        bartStations = newBartStationsArray
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bartStations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        bartStations = appDelegate.allBartStations
        loadHomeWorkStations()
        let cell = tableView.dequeueReusableCell(withIdentifier: "StationCell", for: indexPath) as! StationCell
        cell.resetCell()
        cell.isUserInteractionEnabled = true
        cell.station = bartStations[indexPath.row]
        let endStation = trip.endStation
        if arrival && cell.station.name == (endStation as? BartStation).name {
            cell.isUserInteractionEnabled = false
            cell.makeFontGray()
        }
        if ending && cell.station.name == trip.startStation?.name {
            cell.isUserInteractionEnabled = false
            cell.makeFontGray()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let station = bartStations[indexPath.row]
        if starting {
            routeInputView.setStartingStation(startingStation: station)
            trip.startStation = station
        }
        if ending {
            routeInputView.setEndingStation(endingStation: station)
            trip.endStation = station
        }
        routeInputView.hideStationView()
        routeInputView.setFindButtonStatus()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FindRoutesSegue" {
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
            print(trip)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "hh:mma"
            trip.timeString = dateFormatter.string(from: time)
//            print("time string: \(dateFormatter.string(from: time))")
            vc.userInput = trip
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        routeInputView.delegate = self
        routeInputView.vc = self
        routeInputView.onLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        bartStations = appDelegate.allBartStations
        loadHomeWorkStations()
        routeInputView.setNavigationBar(trainSystem: "Bart")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension RouteInputViewController: RouteInputViewDelegate {
    func routeInputView(routeInputView: RouteInputView, didUpdateTime time: Date) {
        self.time = time
    }
}
