//
//  BartRouteInputViewController.swift
//  BartApp
//
//  Created by Bria Wallace on 4/25/17.
//  Copyright © 2017 Bria Wallace. All rights reserved.
//

import UIKit

class BartRouteInputViewController: UIViewController, ChooseBartStationDelegate {

    @IBOutlet weak var startingStationInputButton: UIButton!
    @IBOutlet weak var endingStationInputButton: UIButton!
    @IBOutlet weak var startingTimeInputButton: UIButton!
    @IBOutlet weak var startingTimeTextField: UITextField!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var findRouteButton: UIButton!
    
    var startingTime: Date!
    var userInputs = [String : Any]()
    
    @IBAction func onStartingTimeButton(_ sender: Any) {
        startingTimeInputButton.isHidden = true
        findRouteButton.isHidden = true
        doneButton.isHidden = false
        timePicker.isHidden = false
//        timePicker.layer.backgroundColor = UIColor.lightGray.cgColor
    }
    
    @IBAction func onDoneButton(_ sender: Any) {
        startingTime = timePicker.date
        let startingTimeString = formatTime(date: startingTime)
        startingTimeInputButton.setTitle(startingTimeString, for: .normal)
        startingTimeInputButton.setTitleColor(UIColor.black, for: .normal)
        userInputs["Start Time"] = startingTime
        doneButton.isHidden = true
        timePicker.isHidden = true
        startingTimeInputButton.isHidden = false
        findRouteButton.isHidden = false
    }
    
    func setStartingStation(chooseBartStationViewController: ChooseBartStationViewController, didSetStartingStation startingStation: BartStation) {
        startingStationInputButton.setTitle("     \(startingStation.name!)     ", for: .normal)
        startingStationInputButton.setTitleColor(UIColor.black, for: .normal)
        userInputs["Start Station"] = startingStation
    }
    
    func setEndingStation(chooseBartStationViewController: ChooseBartStationViewController, didSetEndingStation endingStation: BartStation) {
        endingStationInputButton.setTitle("     \(endingStation.name!)     ", for: .normal)
        endingStationInputButton.setTitleColor(UIColor.black, for: .normal)
        userInputs["End Station"] = endingStation
    }
    
    func formatTime(date: Date) -> (String){
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        var time = "          "
        if hour == 0 {
            time += "12"
        } else if hour < 10 {
            time += "0\(hour)"
        } else if hour > 12 {
            time += "\(hour-12)"
        } else {
            time += "\(hour)"
        }
        time += ":"
        if minutes < 10 {
            time += "0\(minutes)"
        } else {
            time += "\(minutes)"
        }
        if hour < 12 {
            time += " AM          "
        } else {
            time += " PM          "
        }
        return time
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectStartingStationSegue" {
            let vc = segue.destination as! ChooseBartStationViewController
            vc.starting = true
            vc.delegate = self
        } else if segue.identifier == "SelectEndingStationSegue" {
            let vc = segue.destination as! ChooseBartStationViewController
            vc.ending = true
            vc.delegate = self
        } else if segue.identifier == "FindRoutesSegue" {
            let vc = segue.destination as! RoutesViewController
            vc.userInput = userInputs
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timePicker.isHidden = true
        doneButton.isHidden = true
        startingStationInputButton.layer.borderColor = UIColor.black.cgColor
        startingStationInputButton.layer.borderWidth = 0.5
        startingStationInputButton.layer.cornerRadius = 5
        endingStationInputButton.layer.borderColor = UIColor.black.cgColor
        endingStationInputButton.layer.borderWidth = 0.5
        endingStationInputButton.layer.cornerRadius = 5
        startingTimeInputButton.layer.borderColor = UIColor.black.cgColor
        startingTimeInputButton.layer.borderWidth = 0.5
        startingTimeInputButton.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
