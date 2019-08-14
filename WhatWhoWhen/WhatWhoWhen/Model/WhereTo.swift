//
//  WhereTo.swift
//  WhoWhatWhen
//
//  Created by Allbee, Eamon on 5/30/19.
//  Copyright © 2019 Allbee, Eamon. All rights reserved.
//

import Foundation
struct WhereTo {
    private(set) public var title: String
    private(set) public var imageName: String
    private(set) public var objectCount: Int
    
    init(title: String, imageName: String, objectCount: Int) {
        self.title = title
        self.imageName = imageName
        self.objectCount = objectCount
    }
    
}
