//
//  WhatWhoWhen.swift
//  WhoWhatWhen
//
//  Created by Allbee, Eamon on 5/30/19.
//  Copyright © 2019 Allbee, Eamon. All rights reserved.
//

import Foundation
struct WhatWhoWhen {
    private(set) public var wwwProject: String
    private(set) public var who: String
    private(set) public var what: String
    private(set) public var when: Date
    
    init(wwwProject: String, who: String, what: String, when: Date) {
        self.wwwProject = wwwProject
        self.who = who
        self.what = what
        self.when = when
    }
    
    
}
