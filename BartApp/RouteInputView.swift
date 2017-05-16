//
//  RouteInputView.swift
//  BartApp
//
//  Created by Bria Wallace on 4/26/17.
//  Copyright © 2017 Bria Wallace. All rights reserved.
//

import UIKit

@objc protocol RouteInputViewDelegate {
    @objc optional func routeInputView(routeInputView: RouteInputView, didUpdateTime time: Date)
}

class RouteInputView: UIView {

    @IBOutlet weak var findRoutesButton: UIButton!
    @IBOutlet weak var startingStationButton: UIButton!
    @IBOutlet weak var endingStationButton: UIButton!
    @IBOutlet weak var leaveNowButton: UIButton!
    @IBOutlet weak var departureLabelButton: UIButton!
    @IBOutlet weak var arrivalLabelButton: UIButton!
    @IBOutlet weak var startingTimeButton: UIButton!
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var timeView: UIView!
    @IBOutlet weak var timePickerView: UIView!
    @IBOutlet weak var stationView: UIView!
    @IBOutlet weak var tableView: UITableView!
    weak var delegate: RouteInputViewDelegate?
    
    var userInputs = [String : Any]()
    let defaults = UserDefaults.standard
    var primaryColor = Style.primaryColor
    var time = Date()
    
    func onLoad() {
        timePickerView.isHidden = true
        timeView.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        timeView.layer.shadowRadius = 2.0
        timeView.layer.shadowColor = UIColor.black.cgColor
        timeView.layer.shadowOpacity = 0.2
        setFindButtonStatus()
        onLeaveNowButton()
        hideStationView()
    }
    
    func hideStationView() {
        stationView.isHidden = true
        timeView.isHidden = false
        //settingsButton.isEnabled = true
        //settingsButton.setTitleColor(UIColor.black, for: .normal)
    }
    
    func showStationView() {
        tableView.reloadData()
        stationView.isHidden = false
        timeView.isHidden = true
        timePickerView.isHidden = true
        //settingsButton.isEnabled = false
        //settingsButton.setTitleColor(UIColor.lightGray, for: .normal)
    }
    
    func setStartingStation(startingStation: BartStation) {
        startingStationButton.setTitle("\(startingStation.name!)", for: .normal)
        startingStationButton.setTitleColor(UIColor.black, for: .normal)
        userInputs["Start Station"] = startingStation
        setFindButtonStatus()
    }
    
    func clearStartingStation() {
        startingStationButton.setTitle("", for: .normal)
        startingStationButton.setTitleColor(UIColor.black, for: .normal)
        userInputs.removeValue(forKey: "Start Station")
        setFindButtonStatus()
    }
    
    func clearEndingStation() {
        endingStationButton.setTitle("", for: .normal)
        endingStationButton.setTitleColor(UIColor.black, for: .normal)
        userInputs.removeValue(forKey: "End Station")
        setFindButtonStatus()
    }
    
    func setEndingStation(endingStation: BartStation) {
        endingStationButton.setTitle("\(endingStation.name!)", for: .normal)
        endingStationButton.setTitleColor(UIColor.black, for: .normal)
        userInputs["End Station"] = endingStation
        setFindButtonStatus()
    }
    
    func resetButtonStyle() {
        leaveNowButton.setTitleColor(UIColor.lightGray, for: .normal)
        leaveNowButton.layer.cornerRadius = 0
        leaveNowButton.layer.borderWidth = 0
        leaveNowButton.layer.borderColor = UIColor.white.cgColor
        leaveNowButton.layer.backgroundColor = UIColor.white.cgColor
        departureLabelButton.setTitleColor(UIColor.lightGray, for: .normal)
        departureLabelButton.layer.cornerRadius = 0
        departureLabelButton.layer.borderWidth = 0
        departureLabelButton.layer.borderColor = UIColor.white.cgColor
        departureLabelButton.layer.backgroundColor = UIColor.white.cgColor
        arrivalLabelButton.setTitleColor(UIColor.lightGray, for: .normal)
        arrivalLabelButton.layer.cornerRadius = 0
        arrivalLabelButton.layer.borderWidth = 0
        arrivalLabelButton.layer.borderColor = UIColor.white.cgColor
        arrivalLabelButton.layer.backgroundColor = UIColor.white.cgColor
        startingTimeButton.isEnabled = false
        let time = formatTime(date: self.time)
        startingTimeButton.setTitle(time, for: .normal)
        timePickerView.isHidden = true
    }
    
    func onLeaveNowButton() {
        resetButtonStyle()
        leaveNowButton.setTitleColor(UIColor.white, for: .normal)
        leaveNowButton.layer.cornerRadius = 15
        leaveNowButton.layer.borderWidth = 5
        leaveNowButton.layer.borderColor = primaryColor.cgColor
        leaveNowButton.layer.backgroundColor = primaryColor.cgColor
    }
    
    func onDepartureButton() {
        resetButtonStyle()
        departureLabelButton.setTitleColor(UIColor.white, for: .normal)
        departureLabelButton.layer.cornerRadius = 15
        departureLabelButton.layer.borderWidth = 5
        departureLabelButton.layer.borderColor = primaryColor.cgColor
        departureLabelButton.layer.backgroundColor = primaryColor.cgColor
        startingTimeButton.isEnabled = true
    }
    
    func onArrivalButton() {
        resetButtonStyle()
        arrivalLabelButton.setTitleColor(UIColor.white, for: .normal)
        arrivalLabelButton.layer.cornerRadius = 15
        arrivalLabelButton.layer.borderWidth = 5
        arrivalLabelButton.layer.borderColor = primaryColor.cgColor
        arrivalLabelButton.layer.backgroundColor = primaryColor.cgColor
        startingTimeButton.isEnabled = true
    }
    
    func onStartingTimeButton() {
        startingTimeButton.isEnabled = false
        timePickerView.isHidden = false
    }
    
    func setFindButtonStatus() {
        if userInputs.count == 2 {
            findRoutesButton.isEnabled = true
            findRoutesButton.setTitleColor(UIColor.white, for: .normal)
            findRoutesButton.layer.backgroundColor = primaryColor.cgColor
        } else {
            findRoutesButton.isEnabled = false
            findRoutesButton.setTitleColor(UIColor.white, for: .normal)
            findRoutesButton.layer.backgroundColor = UIColor.lightGray.cgColor
        }
    }

    func formatTime(date: Date) -> (String){
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        var time = ""
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
            time += " AM"
        } else {
            time += " PM"
        }
//        print(Calendar.current.component(.weekday, from: date))
        return time
    }

    func updateStyle() {
        primaryColor = Style.primaryColor
    }
    
    @IBAction func onChooseTime(_ sender: Any) {
        if let picker = sender as? UIDatePicker {
            let startingTime = picker.date
            let startingTimeString = formatTime(date: startingTime)
            startingTimeButton.setTitle(startingTimeString, for: .normal)
            startingTimeButton.isEnabled = true
            setFindButtonStatus()
            time = startingTime
            delegate?.routeInputView?(routeInputView: self, didUpdateTime: startingTime)
            startingTimeButton.isEnabled = true
            setFindButtonStatus()
        }
    }
    
}

