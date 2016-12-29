//
//  HomeViewController.swift
//  UpsAndDowns
//
//  Created by Suraya Shivji on 11/20/16.
//  Copyright © 2016 Suraya Shivji. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class HomeViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    var loginButton : FBSDKLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(FBSDKAccessToken.current() != nil) {
            performSegue(withIdentifier: "LoginSuccess", sender: nil)
        }
        
        loginButton = FBSDKLoginButton()
        loginButton.center = self.view.center
        self.view.addSubview(loginButton)
        
        // required app permissions: https://developers.facebook.com/docs/facebook-login/permissions
        loginButton.readPermissions = ["public_profile", "user_friends", "user_about_me", "user_posts"]
        loginButton.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        if (error != nil) {
            // handle error
            let message: String = "An error has occured. \(error)"
            let alertView = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertControllerStyle.alert)
            alertView.addAction(UIAlertAction(title: "Ok ", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertView, animated: true, completion: nil)
        } else if(result.token != nil) {
            performSegue(withIdentifier: "LoginSuccess", sender: nil)
            // successful login - change to segue to main view
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
    }
    
}
