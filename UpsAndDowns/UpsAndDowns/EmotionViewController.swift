//
//  EmotionViewController.swift
//  UpsAndDowns
//
//  Created by Kelly Lampotang on 12/19/16.
//  Copyright © 2016 Suraya Shivji. All rights reserved.
//

import UIKit
import IGListKit

class EmotionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var info:[AnyObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
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
