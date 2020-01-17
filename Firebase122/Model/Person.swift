//
//  Person.swift
//  Firebase122
//
//  Created by mac on 1/17/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation


struct Person {
    let name: String
    let number: String
    let uid: String
}

extension Person {
    var toDict: [String:String] {
        return ["name":self.name, "number":self.number]
    }
}
