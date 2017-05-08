//
//  SettingsViewController.swift
//  BartApp
//
//  Created by Josh Jeong on 5/8/17.
//  Copyright © 2017 Bria Wallace. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var modalView: UIView!
    @IBOutlet weak var homeStationPickerView: UIPickerView!
    @IBOutlet weak var workStationPickerView: UIPickerView!
    @IBOutlet weak var modalTopContstraint: NSLayoutConstraint!
    
    var homeStationIndex = 0
    var workStationIndex = 0
    
    let defaults = UserDefaults.standard
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var bartStations: [BartStation] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        modalTopContstraint.constant = view.frame.size.height
        self.view.alpha = 0
        bartStations = appDelegate.allBartStations
        initPickerViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        showModal()
    }
    
    func initPickerViews() {
        homeStationPickerView.delegate = self
        homeStationPickerView.dataSource = self
        workStationPickerView.delegate = self
        workStationPickerView.dataSource = self
        
        homeStationIndex = defaults.integer(forKey: "Home") 
        workStationIndex = defaults.integer(forKey: "Work")
        
        homeStationPickerView.selectRow(homeStationIndex, inComponent: 0, animated: false)
        workStationPickerView.selectRow(workStationIndex, inComponent: 0, animated: false)
    }
    
    func showModal() {
        UIView.animate(withDuration: 0.4, animations: {
            self.view.alpha = 1
            self.modalTopContstraint.constant = 100
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func dismissModal() {
        UIView.animate(withDuration: 0.4, animations: {
            self.view.alpha = 0
            self.modalTopContstraint.constant = self.view.frame.size.height
            self.view.layoutIfNeeded()
        }) { (completion) in
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    @IBAction func onTapBackground(_ sender: Any) {
        dismissModal()
    }
    
    @IBAction func onCancel(_ sender: Any) {
        dismissModal()
    }
    
    @IBAction func onSave(_ sender: Any) {
        defaults.set(homeStationIndex, forKey: "Home")
        defaults.set(workStationIndex, forKey: "Work")
        dismissModal()
    }
}

extension SettingsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return bartStations.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return bartStations[row].name
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            homeStationIndex = row
            return
        }
        
        if pickerView.tag == 1 {
            workStationIndex = row
        }
    }
}
