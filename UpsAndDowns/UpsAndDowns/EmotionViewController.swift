//
//  EmotionViewController.swift
//  UpsAndDowns
//
//  Created by Kelly Lampotang on 12/19/16.
//  Copyright © 2016 Suraya Shivji. All rights reserved.
//

import UIKit
import IGListKit
import Firebase
import MBProgressHUD

class EmotionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var info:[AnyObject] = []
    
    var messages = [EmotionMessage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getFirebaseData()

        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func getFirebaseData (){
        let userDB = FIRDatabase.database().reference().child(FBSDKAccessToken.current().userID)
        
        MBProgressHUD.showAdded(to: self.view, animated: true)

        userDB.observeSingleEvent(of: .value, with: { (snapshot) in
            let data = snapshot.value as? NSDictionary
            //print("Emotion View Controller printing" + (data?.description)!)
            if (data != nil) {
                for (key, _) in data! { // Go through all Post IDs
                    let message = EmotionMessage(date: (data![key] as! NSDictionary)["Date"] as! String,
                                                 message: (data![key] as! NSDictionary)["Message"] as! String,
                                                 anger:  ((data![key] as! NSDictionary)["Emotion Tone"] as! NSDictionary)["Anger"] as! Double,
                                                 disgust: ((data![key] as! NSDictionary)["Emotion Tone"] as! NSDictionary)["Disgust"] as! Double,
                                                 fear: ((data![key] as! NSDictionary)["Emotion Tone"] as! NSDictionary)["Fear"] as! Double,
                                                 joy: ((data![key] as! NSDictionary)["Emotion Tone"] as! NSDictionary)["Joy"] as! Double,
                                                 sadness: ((data![key] as! NSDictionary)["Emotion Tone"] as! NSDictionary)["Sadness"] as! Double)
                    self.messages.append(message)
                    
                }
            }
            MBProgressHUD.hide(for: self.view, animated: true)
        }) { (error) in
            print(error.localizedDescription)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToneCell", for: indexPath) as! ToneTableViewCell
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info.count
    }


}
