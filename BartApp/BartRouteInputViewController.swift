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
    
    var startingTime: Date!
    var userInputs = [String : Any]()
    
    func setStartingStation(chooseBartStationViewController: ChooseBartStationViewController, didSetStartingStation startingStation: BartStation) {
        bartRouteInputView.setStartingStation(startingStation: startingStation)
        userInputs["Start Station"] = startingStation
    }
    
    func setEndingStation(chooseBartStationViewController: ChooseBartStationViewController, didSetEndingStation endingStation: BartStation) {
        bartRouteInputView.setEndingStation(endingStation: endingStation)
        userInputs["End Station"] = endingStation
    }
    
    @IBAction func onStartingTimeButton(_ sender: Any) {
        bartRouteInputView.onStartingTimeButton()
    }
    
    @IBAction func onDoneButton(_ sender: Any) {
        bartRouteInputView.onDoneButton()
        startingTime = bartRouteInputView.timePicker.date
        userInputs["Start Time"] = startingTime
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
        bartRouteInputView.onLoad()
       
        
       
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
