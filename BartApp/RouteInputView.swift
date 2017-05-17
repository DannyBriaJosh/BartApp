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
    @objc optional func routeInputView(routeInputView: RouteInputView, didSelectTransportation train: String)
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
    @IBOutlet weak var trainSystemView: UIView!
    @IBOutlet weak var caltrainButton: UIButton!
    @IBOutlet weak var bartButton: UIButton!
    @IBOutlet weak var overlayView: UIView!
    
    weak var delegate: RouteInputViewDelegate?
    weak var vc: RouteInputViewController?
    
    var userInputs = [String : Any]()
    var primaryColor = Style.primaryColor
    var time = Date()
    var trainSystemMenuState = false
    var trainSystem = "Bart"
    
    func onLoad() {
        timePickerView.isHidden = true
        timeView.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        timeView.layer.shadowRadius = 2.0
        timeView.layer.shadowColor = UIColor.black.cgColor
        timeView.layer.shadowOpacity = 0.2
        setFindButtonStatus()
        onLeaveNowButton()
        hideStationView()
        initializeTrainSystemView()
        let defaults = UserDefaults()
        if let system = defaults.value(forKey: "trainSystem") as? String {
            trainSystem = system
        }
    }
    
    func initializeTrainSystemView() {
        trainSystemView.isHidden = false
        trainSystemView.frame.origin.y = -150
        trainSystemView.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        trainSystemView.layer.shadowRadius = 2.0
        trainSystemView.layer.shadowColor = UIColor.black.cgColor
        trainSystemView.layer.shadowOpacity = 0.5
        caltrainButton.contentHorizontalAlignment = .left
        bartButton.contentHorizontalAlignment = .left
        overlayView.alpha = 0
        let newTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector (moveTrainSystemMenu(_:)))
        overlayView.addGestureRecognizer(newTapGestureRecognizer)
    }
    
    func onCaltrainSystemButton() {
        onLoad()
        trainSystemMenuState = false
        trainSystem = "Caltrain"
        Style.loadTheme()
        updateStyle()
        setTrainSystemView()
    }
    
    func onBartSystemButton() {
        onLoad()
        trainSystemMenuState = false
        trainSystem = "Bart"
        Style.loadTheme()
        updateStyle()
        setTrainSystemView()
    }
    
    func setTrainSystemView() {
        if trainSystem == "Bart" {
            bartButton.layer.backgroundColor = primaryColor.cgColor
            bartButton.setTitleColor(UIColor.white, for: .normal)
            caltrainButton.layer.backgroundColor = UIColor.white.cgColor
            caltrainButton.setTitleColor(UIColor.black, for: .normal)
        } else if trainSystem == "Caltrain" {
            caltrainButton.layer.backgroundColor = primaryColor.cgColor
            caltrainButton.setTitleColor(UIColor.white, for: .normal)
            bartButton.layer.backgroundColor = UIColor.white.cgColor
            bartButton.setTitleColor(UIColor.black, for: .normal)
        }
        trainSystemView.frame.origin.y = (vc?.navigationController?.navigationBar.frame.height)! + 15
    }
    
    func setNavigationBar(trainSystem: String) {
        var switchView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        var stackView = UIStackView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        if trainSystem == "Caltrain" {
            switchView = UIView(frame: CGRect(x: 0, y: 0, width: 70, height: 50))
            stackView = UIStackView(frame: CGRect(x: 0, y: 0, width: 70, height: 50))
        }
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 0
        stackView.isUserInteractionEnabled = true
        let newTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector (moveTrainSystemMenu(_:)))
        stackView.addGestureRecognizer(newTapGestureRecognizer)
        let trainLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 55, height: 50))
        trainLabel.text = trainSystem
        trainLabel.sizeToFit()
        let arrowImage = UIImageView(image: #imageLiteral(resourceName: "arrow-icon-1"))
        arrowImage.frame = CGRect(x: 0, y: 0, width: 1, height: 1)
        arrowImage.contentMode = .scaleAspectFit
        stackView.addArrangedSubview(trainLabel)
        stackView.addArrangedSubview(arrowImage)
        switchView.addSubview(stackView)
        vc?.navigationItem.titleView = switchView
    }

    func moveTrainSystemMenu(_ gestureRecognizer: UITapGestureRecognizer) {
        toggleMenu()
    }
    
    func toggleMenu() {
        UIView.animate(withDuration: 0.3) {
            let arrowImageView = self.vc?.navigationItem.titleView?.subviews[0].subviews[1] as! UIImageView
            let transform = arrowImageView.transform
            if self.trainSystemMenuState {
                let newTransform = transform.rotated(by: (-1 * (CGFloat.pi - 0.000000001)))
                arrowImageView.transform = newTransform
                self.trainSystemView.frame.origin.y = -150
                self.overlayView.alpha = 0
                self.overlayView.isHidden = true
            } else {
                let newTransform = transform.rotated(by: CGFloat.pi)
                arrowImageView.transform = newTransform
                self.trainSystemView.frame.origin.y = (self.vc?.navigationController?.navigationBar.frame.height)! + 15
                self.trainSystemView.isHidden = false
                self.overlayView.alpha = 0.3
                self.overlayView.isHidden = false
            }
        }
        trainSystemMenuState = !trainSystemMenuState
    }
    
    func hideStationView() {
        stationView.isHidden = true
        timeView.isHidden = false
    }
    
    func showStationView() {
        tableView.reloadData()
        stationView.isHidden = false
        timeView.isHidden = true
        timePickerView.isHidden = true
    }
    
    func setStartingStation(startingStation: Station) {
        startingStationButton.contentHorizontalAlignment = .left
        startingStationButton.setTitle("   \(startingStation.name!.uppercased())", for: .normal)
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
    
    func setEndingStation(endingStation: Station) {
        endingStationButton.contentHorizontalAlignment = .left
        endingStationButton.setTitle("  \(endingStation.name!.uppercased())", for: .normal)
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
        let time = formatTime(date: Date())
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
    
    @IBAction func onSelectBart(_ sender: UIButton) {
        toggleMenu()
        delegate?.routeInputView?(routeInputView: self, didSelectTransportation: "Bart")
    }
    
    @IBAction func onSelectCaltrain(_ sender: UIButton) {
        toggleMenu()
        delegate?.routeInputView?(routeInputView: self, didSelectTransportation: "Caltrain")
    }
}

