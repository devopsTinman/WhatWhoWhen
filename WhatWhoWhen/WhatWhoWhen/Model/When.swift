//
//  When.swift
//  WhoWhatWhen
//
//  Created by Allbee, Eamon on 5/30/19.
//  Copyright © 2019 Allbee, Eamon. All rights reserved.
//

import Foundation
struct When {
    private(set) public var dateDue: Date
    private(set) public var pastDue: String
    
    init(dateDue: Date, pastDue: String) {
        self.dateDue = dateDue
        self.pastDue = pastDue
    }
}
