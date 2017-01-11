//
//  LanguageViewController.swift
//  UpsAndDowns
//
//  Created by Kelly Lampotang on 12/19/16.
//  Copyright © 2016 Suraya Shivji. All rights reserved.
//

import UIKit
import IGListKit
import Firebase
import MBProgressHUD

class LanguageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var info:[AnyObject] = []
    var messages = [LanguageMessage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getFirebaseData()
        tableView.dataSource = self
        tableView.delegate = self
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
                    let message = LanguageMessage(date: (data![key] as! NSDictionary)["Date"] as! String,
                                                  message: (data![key] as! NSDictionary)["Message"] as! String,
                                                  analytical: ((data![key] as! NSDictionary)["Language Tone"] as! NSDictionary)["Analytical"] as! Double,
                                                  confident: ((data![key] as! NSDictionary)["Language Tone"] as! NSDictionary)["Confident"] as! Double,
                                                  tentative: ((data![key] as! NSDictionary)["Language Tone"] as! NSDictionary)["Tentative"] as! Double)
                    self.messages.append(message)
                }
            }
            MBProgressHUD.hide(for: self.view, animated: true)
        }) { (error) in
            print(error.localizedDescription)
        }
    }

    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToneCell", for: indexPath) as! ToneTableViewCell
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return info.count
    }


}
