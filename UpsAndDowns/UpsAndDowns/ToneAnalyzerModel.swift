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
    let toneAnalyzer : ToneAnalyzer
    private var toneAnalysis : ToneAnalysis?
    
    //Initializer for the model
    private init () {
        let username = "be1998e8-409d-4492-a4c3-525098ed9acb"
        let password = "buyG80qtk4Bu"
        let version = "2017-01-06" // use today's date for the most recent version
        
        toneAnalyzer = ToneAnalyzer(username: username, password: password, version: version)
        toneAnalysis = nil
    }
    
    
    func getToneAnalysis (text: String) {
        
        let failure = { (error: Error) in
            self.toneAnalysis = nil
            print(error)
        }
        
        toneAnalyzer.getTone(ofText: text, failure: failure) { tones in
            self.toneAnalysis = tones
            print(tones)
        }
    }
    
    func getEmotionTones (tones: ToneAnalysis) -> [String : Double] {
        var emotionTones = [String : Double]()
        for i in 0...tones.documentTone.count {
            if(tones.documentTone[i].name == "Emotion Tone") {
                for j in 0...tones.documentTone[i].tones.count {
                    emotionTones[tones.documentTone[i].tones[j].name] = tones.documentTone[i].tones[j].score
                }
                break
            }
        }
        return emotionTones
    }
    
    func getLanguageTones (tones: ToneAnalysis) -> [String : Double] {
        var languageTones = [String : Double]()
        for i in 0...tones.documentTone.count {
            if(tones.documentTone[i].name == "Language Tone") {
                for j in 0...tones.documentTone[i].tones.count {
                    languageTones[tones.documentTone[i].tones[j].name] = tones.documentTone[i].tones[j].score
                }
                break
            }
        }
        return languageTones
    }
    
    func getSocialTones (tones: ToneAnalysis) -> [String : Double] {
        var socialTones = [String : Double]()
        for i in 0...tones.documentTone.count {
            if(tones.documentTone[i].name == "Social Tone") {
                for j in 0...tones.documentTone[i].tones.count {
                    socialTones[tones.documentTone[i].tones[j].name] = tones.documentTone[i].tones[j].score
                }
                break
            }
        }
        return socialTones
    }
}
