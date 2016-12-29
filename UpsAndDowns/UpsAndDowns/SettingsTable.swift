//
//  SettingsTable.swift
//  UpsAndDowns
//
//  Created by Suraya Shivji on 11/27/16.
//  Copyright © 2016 Suraya Shivji. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

protocol SettingsDelegate {
    func hideSettingsView(status : Bool)
    func logout(status:Bool)
}

class Settings: UIView,  UITableViewDelegate, UITableViewDataSource {

    //MARK: Properties
    let items = ["Settings", "Invite Friends", "Help", "Add someting else", "Logout", "Cancel"]
    let imageNames = ["settings", "settings", "settings", "settings", "settings", "settings"]
    lazy var tableView: UITableView = {
        let tb = UITableView.init(frame: CGRect.init(x: 0, y: self.bounds.height, width: self.bounds.width, height: 288))
        tb.isScrollEnabled = false
        return tb
    }()
    
    lazy var backgroundView: UIView = {
       let bv = UIView.init(frame: self.frame)
       bv.backgroundColor = UIColor.black
        bv.alpha = 0
        return bv
    }()
    
    var delegate: SettingsDelegate?
    
    //MARK: Methods
    func animate()  {
        UIView.animate(withDuration: 0.3, animations: {
        self.tableView.frame.origin.y -= 288
        self.backgroundView.alpha = 0.5
        })
    }
    
    func  dismiss()  {
        UIView.animate(withDuration: 0.3, animations: {
            self.backgroundView.alpha = 0
            self.tableView.frame.origin.y += 288
            }, completion: {(Bool) in
                self.delegate?.hideSettingsView(status: true)
        })
    }
    
    //MARK: TableView Delegate, DataSource methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        cell.imageView?.image = UIImage.init(named: imageNames[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 4) { //Logout
            let loginManager = FBSDKLoginManager()
            loginManager.logOut()
            print("Logout")
            self.delegate?.logout(status: true)
        }
        else {
            dismiss()
        }
    }
  
    //Inits
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(Settings.dismiss)))
        self.addSubview(self.backgroundView)
        self.addSubview(tableView)
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.tableView.separatorStyle = .none
    }
    
}
