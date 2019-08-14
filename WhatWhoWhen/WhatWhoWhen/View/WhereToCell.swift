//
//  WhereToCell.swift
//  WhatWhoWhen
//
//  Created by Allbee, Eamon on 8/13/19.
//  Copyright © 2019 Allbee, Eamon. All rights reserved.
//

import UIKit

class WhereToCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var whereToImage: UIImageView!
    @IBOutlet weak var whereToTitle: UILabel!
    @IBOutlet weak var whereToCount: UILabel!
    
    func updateViews(whereTo: WhereTo) {
        whereToImage.image = UIImage(named: whereTo.imageName)
        whereToTitle.text = whereTo.title
        whereToCount.text = String(whereTo.objectCount)
    }
}
