//
//  EmotionMessage.swift
//  UpsAndDowns
//
//  Created by Jonathan Wang on 1/10/17.
//  Copyright © 2017 Suraya Shivji. All rights reserved.
//

import UIKit

class EmotionMessage: NSObject {

    var date : String
    var message : String
    var day : Int
    var month : Int
    var year : Int
    var anger : Double
    var disgust : Double
    var fear : Double
    var joy : Double
    var sadness : Double
    
    init(date : String, message : String, anger : Double, disgust: Double, fear: Double, joy : Double, sadness : Double) {
        self.date = date
        
        let index = date.index(date.startIndex, offsetBy: 4)
        self.year = Int(date.substring(to: index))!
        
        let monthSubstring = date.index(date.startIndex, offsetBy: 6)..<date.index(date.endIndex, offsetBy: -3)
        self.month = Int(date.substring(with: monthSubstring))!
        
        let daySubstring = date.index(date.startIndex, offsetBy: 8)
        self.day = Int(date.substring(from: daySubstring))!
        
        self.message = message
        self.anger = anger
        self.disgust = disgust
        self.fear = fear
        self.joy = joy
        self.sadness = sadness

    }
    
    func isMoreRecentThan (message : EmotionMessage ) -> Bool {
        return self.year > message.year && self.month > message.month && self.day > message.day
    }
}
