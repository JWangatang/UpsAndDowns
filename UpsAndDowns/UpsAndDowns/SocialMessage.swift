//
//  SocialMessage.swift
//  UpsAndDowns
//
//  Created by Jonathan Wang on 1/10/17.
//  Copyright © 2017 Suraya Shivji. All rights reserved.
//

import UIKit

class SocialMessage: NSObject {

    var date : String
    var message : String
    var day : Int
    var month : Int
    var year : Int
    
    var agreeableness: Double
    var conscientiousness: Double
    var emotionalRange: Double
    var extraversion: Double
    var openness: Double

    
    init(date : String, message : String, agreeableness: Double, conscientiousness: Double, emotionalRange: Double, extraversion: Double, openness: Double) {
        self.date = date
        
        let index = date.index(date.startIndex, offsetBy: 4)
        self.year = Int(date.substring(to: index))!
        
        let monthSubstring = date.index(date.startIndex, offsetBy: 6)..<date.index(date.endIndex, offsetBy: -3)
        self.month = Int(date.substring(with: monthSubstring))!
        
        let daySubstring = date.index(date.startIndex, offsetBy: 8)
        self.day = Int(date.substring(from: daySubstring))!
        
        self.message = message
        self.agreeableness = agreeableness
        self.conscientiousness = conscientiousness
        self.emotionalRange = emotionalRange
        self.extraversion = extraversion
        self.openness = openness
    }
    
    func isMoreRecentThan (message : SocialMessage ) -> Bool {
        return self.year > message.year && self.month > message.month && self.day > message.day
    }
    
}
