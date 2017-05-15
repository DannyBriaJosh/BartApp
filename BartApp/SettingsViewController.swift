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
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var modalTopContstraint: NSLayoutConstraint!
    @IBOutlet weak var homeTextField: UITextField!
    @IBOutlet weak var workTextField: UITextField!
    @IBOutlet weak var homeStationButton: UIButton!
    @IBOutlet weak var workStationButton: UIButton!
    @IBOutlet weak var pickerViewHeightConstraint: NSLayoutConstraint!
    
    
    var currentTextField: UITextField?
    var homeStationIndex: Int?
    var workStationIndex: Int?
    
    let defaults = UserDefaults.standard
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var bartStations: [BartStation] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.alpha = 0
        modalTopContstraint.constant = view.frame.size.height
        bartStations = appDelegate.allBartStations
        initPickerViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        showModal()
    }
    
    func initPickerViews() {
        pickerViewHeightConstraint.constant = 0
        pickerView.delegate = self
        pickerView.dataSource = self
        
        if let savedHomeStationIndex = defaults.object(forKey: "Home") {
            homeStationIndex = savedHomeStationIndex as? Int
            homeTextField.text = bartStations[homeStationIndex!].name
        }
        
        if let savedWorkStationIndex = defaults.object(forKey: "Work") {
            workStationIndex = savedWorkStationIndex as? Int
            workTextField.text = bartStations[workStationIndex!].name
        }
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
    
    func showStationPicker() {
        UIView.animate(withDuration: 0.4, animations: {
            self.pickerViewHeightConstraint.constant = 125
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    @IBAction func onTapHomeStation(_ sender: UIButton) {
        currentTextField = homeTextField
        
        if let index = homeStationIndex {
            pickerView.selectRow(index, inComponent: 0, animated: true)
        }
        
        if pickerViewHeightConstraint.constant == 0 {
            showStationPicker()
        }
    }
    
    @IBAction func onTapWorkStation(_ sender: UIButton) {
        currentTextField = workTextField
        
        if let index = workStationIndex {
            pickerView.selectRow(index, inComponent: 0, animated: true)
        }
        
        if pickerViewHeightConstraint.constant == 0 {
            showStationPicker()
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
        if currentTextField == homeTextField {
            homeStationIndex = row
        } else {
            workStationIndex = row
        }
        
        currentTextField?.text = bartStations[row].name
    }
}
