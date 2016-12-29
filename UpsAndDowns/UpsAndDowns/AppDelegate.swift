//
//  AppDelegate.swift
//  UpsAndDowns
//
//  Created by Suraya Shivji on 11/15/16.
//  Copyright © 2016 Suraya Shivji. All rights reserved.
//

import UIKit
import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var initialViewController :UIViewController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        if(FBSDKAccessToken.current() != nil) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            let initialViewController = storyboard.instantiateViewController(withIdentifier: "NavVC")
            
            self.window?.rootViewController = initialViewController
            self.window?.makeKeyAndVisible()
            
            return true
        }
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        let handled : Bool = FBSDKApplicationDelegate.sharedInstance().application(
            app,
            open: url as URL!,
            sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as! String,
            annotation: options[UIApplicationOpenURLOptionsKey.annotation]
        )
        return handled
    }
}
