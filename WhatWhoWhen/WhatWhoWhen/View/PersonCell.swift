//
//  PersonCell.swift
//  WhoWhatWhen
//
//  Created by Allbee, Eamon on 7/9/19.
//  Copyright © 2019 Allbee, Eamon. All rights reserved.
//

import UIKit

class PersonCell: UITableViewCell {
    
    @IBOutlet weak var lblPersonName: UILabel!
    
    @IBOutlet weak var lblPersonEmail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func updateViews(person: Who) {
        lblPersonName.text = person.name
        lblPersonEmail.text = person.email
    }
    
}
