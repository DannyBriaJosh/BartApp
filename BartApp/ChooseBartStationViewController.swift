//
//  ChooseBartStationViewController.swift
//  BartApp
//
//  Created by Bria Wallace on 4/25/17.
//  Copyright © 2017 Bria Wallace. All rights reserved.
//

import UIKit

protocol ChooseBartStationDelegate: class {
    func setStartingStation(chooseBartStationViewController: ChooseBartStationViewController, didSetStartingStation startingStation: BartStation)
    func setEndingStation(chooseBartStationViewController: ChooseBartStationViewController, didSetEndingStation endingStation: BartStation)
}

class ChooseBartStationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    weak var delegate: ChooseBartStationDelegate?
    
    var bartStations: [BartStation]! = []
    var otherSelectedStation: BartStation?
    var starting = false
    var ending = false
    var homeStation: BartStation?
    var workStation: BartStation?
    
    @IBOutlet var chooseBartStationView: ChooseBartStationView!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        bartStations = appDelegate.allBartStations
        chooseBartStationView.setInstructionLabel(starting: starting, ending: ending)
        loadHomeWorkStations()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "BartStationCell", for: indexPath) as! BartStationCell
        cell.resetCell()
        cell.isUserInteractionEnabled = true
        cell.station = bartStations[indexPath.row]
        if cell.station.name == otherSelectedStation?.name {
            cell.isUserInteractionEnabled = false
            cell.makeFontGray()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if starting {
            delegate?.setStartingStation(chooseBartStationViewController: self, didSetStartingStation: bartStations[indexPath.row])
        }
        if ending {
            delegate?.setEndingStation(chooseBartStationViewController: self, didSetEndingStation: bartStations[indexPath.row])
        }
        dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
