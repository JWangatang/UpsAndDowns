//
//  LanguageMessage.swift
//  UpsAndDowns
//
//  Created by Jonathan Wang on 1/10/17.
//  Copyright © 2017 Suraya Shivji. All rights reserved.
//

import UIKit

class LanguageMessage: NSObject {
    
    var date : String
    var message : String
    var analytical : Double
    var confident : Double
    var tentative : Double
    var day : Int
    var month : Int
    var year : Int
    
    init(date : String, message : String, analytical : Double, confident: Double, tentative: Double) {
        self.date = date
        self.message = message
        self.analytical = analytical
        self.confident = confident
        self.tentative = tentative
        let index = date.index(date.startIndex, offsetBy: 4)
        self.year = Int(date.substring(to: index))!
        
        let monthSubstring = date.index(date.startIndex, offsetBy: 6)..<date.index(date.endIndex, offsetBy: -3)
        self.month = Int(date.substring(with: monthSubstring))!
        
        let daySubstring = date.index(date.startIndex, offsetBy: 8)
        self.day = Int(date.substring(from: daySubstring))!
    }
    
    func isMoreRecentThan (message : LanguageMessage ) -> Bool {
        return self.year > message.year && self.month > message.month && self.day > message.day
    }
}
