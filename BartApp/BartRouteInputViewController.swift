//
//  BartRouteInputViewController.swift
//  BartApp
//
//  Created by Bria Wallace on 4/25/17.
//  Copyright © 2017 Bria Wallace. All rights reserved.
//

import UIKit

class BartRouteInputViewController: UIViewController {

    @IBOutlet weak var startingStationInputButton: UIButton!
    @IBOutlet weak var endingStationInputButton: UIButton!
    @IBOutlet weak var startingTimeTextField: UITextField!
    @IBOutlet weak var timePicker: UIDatePicker!
    
//    @IBAction func onStartingStationButton(_ sender: Any) {
//        performSegue(withIdentifier: "SelectStartingStationSegue", sender: self)
//    }
//    
//    @IBAction func onEndingStationButton(_ sender: Any) {
//        performSegue(withIdentifier: "SelectEndingStationSegue", sender: self)
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectStartingStationSegue" {
            let vc = segue.destination as! ChooseBartStationViewController
            vc.instruction = "Choose a starting station:"
        } else if segue.identifier == "SelectEndingStationSegue" {
            let vc = segue.destination as! ChooseBartStationViewController
            vc.instruction = "Choose an ending station:"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
