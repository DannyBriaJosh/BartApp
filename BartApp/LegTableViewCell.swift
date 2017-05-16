//
//  LegTableViewCell.swift
//  BartApp
//
//  Created by Josh Jeong on 5/14/17.
//  Copyright © 2017 Bria Wallace. All rights reserved.
//

import UIKit

class LegTableViewCell: UITableViewCell {
    @IBOutlet weak var departingTimeLabel: UILabel!
    @IBOutlet weak var departingStationLabel: UILabel!
    @IBOutlet weak var departingTrainLabel: UILabel!
    @IBOutlet weak var topLineView: UIView!
    @IBOutlet weak var bottomLineView: UIView!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var isLast = false
    
    var leg: Leg? {
        didSet {
            
            
            if isLast {
                print("test")
                if let stationInitial = leg?.destination {
                    let bartStations = appDelegate.allBartStations
                    if let stationIndex = BartStation.getIndex(initial: stationInitial) {
                        let station = bartStations[stationIndex]
                        if let stationName = station.name {
                            departingStationLabel.text = "\(stationName) Station"
                        }
                    }
                }
                if let time = leg?.arriveTime {
                    departingTimeLabel.text = time
                }
                departingTrainLabel.isHidden = true
            } else {
                if let stationInitial = leg?.origin {
                    let bartStations = appDelegate.allBartStations
                    if let stationIndex = BartStation.getIndex(initial: stationInitial) {
                        let station = bartStations[stationIndex]
                        if let stationName = station.name {
                            departingStationLabel.text = "\(stationName) Station"
                        }
                    }
                }
                if let time = leg?.departTime {
                    departingTimeLabel.text = time
                }
                if let train = leg?.line {
                    let route = BartStation.routeInfo(initial: train)
                    let line = route["name"] as! String
                    departingTrainLabel.text = line
                }
            }
        }
    }
    
    var place: String! {
        didSet {
            topLineView.isHidden = true
            bottomLineView.isHidden = true
            
            switch place {
            case "first":
                bottomLineView.isHidden = false
                break
            case "last":
                topLineView.isHidden = false
                break
            case "single":
                break
            default:
                topLineView.isHidden = false
                bottomLineView.isHidden = false
                break
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
