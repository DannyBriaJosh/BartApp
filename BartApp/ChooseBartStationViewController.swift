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
    var starting = false
    var ending = false
    
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        bartStations = appDelegate.allBartStations
        if starting {
            instructionLabel.text = "Choose a starting station:"
        }
        if ending {
            instructionLabel.text = "Choose a ending station:"
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bartStations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BartStationCell", for: indexPath) as! BartStationCell
        let station = bartStations[indexPath.row]
        cell.stationName = station.name
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
