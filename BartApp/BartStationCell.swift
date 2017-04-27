//
//  BartStationCell.swift
//  BartApp
//
//  Created by Bria Wallace on 4/25/17.
//  Copyright © 2017 Bria Wallace. All rights reserved.
//

import UIKit

class BartStationCell: UITableViewCell {

    @IBOutlet weak var stationNameLabel: UILabel!
    
    var station: BartStation! {
        didSet {
            stationNameLabel.text = station.name
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
