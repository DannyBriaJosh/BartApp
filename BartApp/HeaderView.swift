//
//  HeaderView.swift
//  BartApp
//
//  Created by Danny Glover on 5/15/17.
//  Copyright © 2017 Bria Wallace. All rights reserved.
//

import UIKit

class HeaderView: UITableViewCell {

    @IBOutlet weak var tripNumberLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
