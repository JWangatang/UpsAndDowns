//
//  ToneTableViewCell.swift
//  UpsAndDowns
//
//  Created by Kelly Lampotang on 12/26/16.
//  Copyright © 2016 Suraya Shivji. All rights reserved.
//

import UIKit

class ToneTableViewCell: UITableViewCell {

    @IBOutlet weak var analysisLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
