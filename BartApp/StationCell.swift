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
    @IBOutlet weak var iconImageView: UIImageView!
    let defaults = UserDefaults.standard
    
    var station: BartStation! {
        didSet {
            stationNameLabel.text = station.name
            iconImageView.image = nil
            if let savedHomeInitial = defaults.object(forKey: "HomeInitial") as? String {
                if station.initial! == savedHomeInitial {
                    iconImageView.image = UIImage(named: "home-icon")
                }
            }
            
            if let savedWorkInitial = defaults.object(forKey: "WorkInitial")  as? String {
                if station.initial! == savedWorkInitial {
                    iconImageView.image = UIImage(named: "building-icon")
                }
            }
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
