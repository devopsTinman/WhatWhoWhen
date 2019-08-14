//
//  WWWCell.swift
//  WhoWhatWhen
//
//  Created by Allbee, Eamon on 6/6/19.
//  Copyright © 2019 Allbee, Eamon. All rights reserved.
//

import UIKit

class WWWCell: UITableViewCell {
    
    
    @IBOutlet weak var whatLbl: UILabel!
    @IBOutlet weak var whoLbl: UILabel!
    @IBOutlet weak var whenLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func updateViews(whatWhoWhen: WhatWhoWhen) {
        whatLbl.text = whatWhoWhen.what
        whoLbl.text = whatWhoWhen.who
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MMM-yyyy"
        let whenString = "Due: " + formatter.string(from: whatWhoWhen.when)
        whenLbl.text = whenString
    }
    
}
