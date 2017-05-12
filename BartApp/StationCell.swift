//
//  StationCell.swift
//  BartApp
//
//  Created by Bria Wallace on 4/25/17.
//  Copyright © 2017 Bria Wallace. All rights reserved.
//

import UIKit

class StationCell: UITableViewCell {

    @IBOutlet weak var stationNameLabel: UILabel!
    
    var station: BartStation! {
        didSet {
            stationNameLabel.text = station.name
        }
    }
    
    func makeFontGray() {
        stationNameLabel.textColor = UIColor.gray
    }
    
    func resetCell() {
        stationNameLabel.textColor = UIColor.black
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