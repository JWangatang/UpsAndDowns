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

class SocialViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var messages = [SocialMessage]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getFirebaseData()


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
            }
            MBProgressHUD.hide(for: self.view, animated: true)
        }) { (error) in
            print(error.localizedDescription)
        }
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
