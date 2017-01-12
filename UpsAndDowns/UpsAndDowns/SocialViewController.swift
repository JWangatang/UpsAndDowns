//
//  SocialViewController.swift
//  UpsAndDowns
//
//  Created by Kelly Lampotang on 1/10/17.
//  Copyright © 2017 Suraya Shivji. All rights reserved.
//

import UIKit
import Firebase
import MBProgressHUD

class SocialViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var messages = [SocialMessage]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getFirebaseData()
        tableView.dataSource = self
        tableView.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getFirebaseData (){
        let userDB = FIRDatabase.database().reference().child(FBSDKAccessToken.current().userID)
        
        MBProgressHUD.showAdded(to: self.view, animated: true)
        
        userDB.observeSingleEvent(of: .value, with: { (snapshot) in
            let data = snapshot.value as? NSDictionary
            //print("Emotion View Controller printing" + (data?.description)!)
            if (data != nil) {
                for (key, _) in data! { // Go through all Post IDs
                    let message = SocialMessage((date: (data![key] as! NSDictionary)["Date"] as! String,
                                                 message: (data![key] as! NSDictionary)["Message"] as! String,
                                                 agreeableness: ((data![key] as! NSDictionary)["Social Tone"] as! NSDictionary)["Agreeableness"] as! Double,
                                                 conscientiousness: ((data![key] as! NSDictionary)["Social Tone"] as! NSDictionary)["Conscientiousness"] as! Double,
                                                 emotionalRange: ((data![key] as! NSDictionary)["Social Tone"] as! NSDictionary)["Emotional Range"] as! Double,
                                                 extraversion: ((data![key] as! NSDictionary)["Social Tone"] as! NSDictionary)["Extraversion"] as! Double,
                                                 openness: ((data![key] as! NSDictionary)["Social Tone"] as! NSDictionary)["Openness"] as! Double))
                    self.messages.append(message)
                    
                }
                self.tableView.reloadData()
            }
            MBProgressHUD.hide(for: self.view, animated: true)
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToneCell") as! ToneTableViewCell
        cell.dateLabel.text = messages[indexPath.row].date
        cell.messageLabel.text = messages[indexPath.row].message
        cell.analysisLabel.text = "Agreeableness: \(messages[indexPath.row].agreeableness) | Emotional Range: \(messages[indexPath.row].emotionalRange) | Conscientiousness: \(messages[indexPath.row].conscientiousness) | Extraversion: \(messages[indexPath.row].extraversion) | Openness: \(messages[indexPath.row].openness)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    

    

}
