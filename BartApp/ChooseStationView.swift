//
//  ChooseStationView.swift
//  BartApp
//
//  Created by Bria Wallace on 4/26/17.
//  Copyright © 2017 Bria Wallace. All rights reserved.
//

import UIKit

class ChooseStationView: UIView {

    @IBOutlet weak var instructionLabel: UILabel!
    
    func setInstructionLabel(starting: Bool, ending: Bool) {
        if starting {
            instructionLabel.text = "Choose a starting station:"
        }
        if ending {
            instructionLabel.text = "Choose an ending station:"
        }
    }

}
