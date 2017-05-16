//
//  Style.swift
//  BartApp
//
//  Created by Josh Jeong on 5/15/17.
//  Copyright © 2017 Bria Wallace. All rights reserved.
//

import Foundation
import UIKit

struct Style {
    static var primaryColor = UIColor(red: 246/255, green: 112/255, blue: 87/255, alpha: 1)
    
    static func blueTheme() {
        primaryColor = UIColor(red: 100/255, green: 140/255, blue: 255/255, alpha: 1)
    }
    
    static func redTheme() {
        primaryColor = UIColor(red: 246/255, green: 112/255, blue: 87/255, alpha: 1)
    }
    
    static func loadTheme() {
        let defaults = UserDefaults.standard
        
        if let trainTransportation = defaults.string(forKey: "trainSystem") {
            switch trainTransportation {
            case "Bart":
                redTheme()
                break
            case "Caltrain":
                blueTheme()
                break
            default:
                redTheme()
                break
            }
        }
    }
}
