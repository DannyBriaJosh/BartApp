//
//  TripStationCell.swift
//  BartApp
//
//  Created by Danny Glover on 5/7/17.
//  Copyright © 2017 Bria Wallace. All rights reserved.
//

import UIKit

class TripStationCell: UITableViewCell {
    
    @IBOutlet weak var departStationLabel: UILabel!
    @IBOutlet weak var departTimeLabel: UILabel!
    
    @IBOutlet weak var destinationStationLabel: UILabel!
    
    var leg: Leg? {
        didSet {
            
            if let origin = leg?.origin {
                departStationLabel.text = origin
            }
            
            if let destination = leg?.destination {
                destinationStationLabel.text = destination
            }
            if let departTime = leg?.departTime {
                departTimeLabel.text = departTime
            }
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
