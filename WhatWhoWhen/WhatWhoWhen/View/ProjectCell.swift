//
//  ProjectCell.swift
//  WhoWhatWhen
//
//  Created by Allbee, Eamon on 6/19/19.
//  Copyright © 2019 Allbee, Eamon. All rights reserved.
//

import UIKit

class ProjectCell: UITableViewCell {
    
    
    @IBOutlet weak var projectLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func updateViews(wwwProject: WWWProject) {
        projectLbl.text = wwwProject.name
    }
    
}
