//
//  Project.swift
//  WhoWhatWhen
//
//  Created by Allbee, Eamon on 5/30/19.
//  Copyright © 2019 Allbee, Eamon. All rights reserved.
//

import Foundation
struct WWWProject {
    private(set) public var name: String
    private(set) public var dateDue: Date
    private(set) public var startDate: Date
    
    init(name: String, dateDue: Date, startDate: Date) {
        self.name = name
        self.dateDue = dateDue
        self.startDate = startDate
    }
    
}
