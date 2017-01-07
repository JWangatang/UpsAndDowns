//
//  ToneAnalyzerModel.swift
//  UpsAndDowns
//
//  Created by Jonathan Wang on 1/6/17.
//  Copyright © 2017 Suraya Shivji. All rights reserved.
//

import Foundation
import ToneAnalyzerV3

class ToneAnalyzerModel {
    
    static let sharedInstance = ToneAnalyzerModel()
    
    //Initializer for the model
    private init () {
        let username = "be1998e8-409d-4492-a4c3-525098ed9acb"
        let password = "buyG80qtk4Bu"
        let version = "2017-01-06" // use today's date for the most recent version
        
        let toneAnalyzer = ToneAnalyzer(username: username, password: password, version: version)
        
    }
    
    /*
    func getToneData (text: String) -> Dictionary {
        let text = "your-input-text"
        let failure = { (error: Error) in print(error) }
        toneAnalyzer.getTone(ofText: text, failure: failure) { tones in
            print(tones)
            return tones
        }
        return nil
        
    }
 */
    
    
}
