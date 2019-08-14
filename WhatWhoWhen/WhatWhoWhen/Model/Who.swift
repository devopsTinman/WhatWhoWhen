//
//  Who.swift
//  WhoWhatWhen
//
//  Created by Allbee, Eamon on 5/30/19.
//  Copyright © 2019 Allbee, Eamon. All rights reserved.
//
import Foundation
struct Who {
    private(set) public var name: String
    private(set) public var email: String
    private(set) public var password: String
    private(set) public var signinType: String
    
    init(name: String, email: String, password: String, signinType: String) {
        self.name = name
        self.email = email
        self.password = password
        self.signinType = signinType
    }
    
}
