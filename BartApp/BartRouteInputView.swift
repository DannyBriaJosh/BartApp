//
//  BartRouteInputView.swift
//  BartApp
//
//  Created by Bria Wallace on 4/26/17.
//  Copyright © 2017 Bria Wallace. All rights reserved.
//

import UIKit

class BartRouteInputView: UIView {

    @IBOutlet weak var findRoutesButton: UIButton!
    @IBOutlet weak var startingStationButton: UIButton!
    @IBOutlet weak var endingStationButton: UIButton!
    @IBOutlet weak var startingTimeButton: UIButton!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var doneButton: UIButton!
    
    var userInputs = [String : Any]()
    
    func onLoad() {
        timePicker.isHidden = true
        doneButton.isHidden = true
        startingStationButton.layer.borderColor = UIColor.black.cgColor
        startingStationButton.layer.borderWidth = 0.5
        startingStationButton.layer.cornerRadius = 5
        endingStationButton.layer.borderColor = UIColor.black.cgColor
        endingStationButton.layer.borderWidth = 0.5
        endingStationButton.layer.cornerRadius = 5
        startingTimeButton.layer.borderColor = UIColor.black.cgColor
        startingTimeButton.layer.borderWidth = 0.5
        startingTimeButton.layer.cornerRadius = 5
        setFindButtonStatus()
    }
    
    func setStartingStation(startingStation: BartStation) {
        startingStationButton.setTitle("     \(startingStation.name!)     ", for: .normal)
        startingStationButton.setTitleColor(UIColor.black, for: .normal)
        userInputs["Start Station"] = startingStation
        setFindButtonStatus()
    }
    
    func setEndingStation(endingStation: BartStation) {
        endingStationButton.setTitle("     \(endingStation.name!)     ", for: .normal)
        endingStationButton.setTitleColor(UIColor.black, for: .normal)
        userInputs["End Station"] = endingStation
        setFindButtonStatus()

    }
    
    func onStartingTimeButton() {
        startingTimeButton.isHidden = true
        findRoutesButton.isHidden = true
        doneButton.isHidden = false
        timePicker.isHidden = false
    }
    
    func onDoneButton() {
        let startingTime = timePicker.date
        let startingTimeString = formatTime(date: startingTime)
        startingTimeButton.setTitle(startingTimeString, for: .normal)
        startingTimeButton.setTitleColor(UIColor.black, for: .normal)
        doneButton.isHidden = true
        timePicker.isHidden = true
        startingTimeButton.isHidden = false
        findRoutesButton.isHidden = false
        userInputs["Start Time"] = startingTime
        setFindButtonStatus()
    }
    
    func setFindButtonStatus() {
        if userInputs.count == 3 {
            findRoutesButton.isEnabled = true
            findRoutesButton.setTitleColor(UIColor.black, for: .normal)
        } else {
            findRoutesButton.isEnabled = false
            findRoutesButton.setTitleColor(UIColor.lightGray, for: .normal)
        }
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

}
