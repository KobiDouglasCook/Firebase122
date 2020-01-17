//
//  Person.swift
//  Firebase122
//
//  Created by mac on 1/17/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
import Firebase

struct Person {
    let name: String
    let number: String
    let uid: String
}

extension Person {
    var toDict: [String:String] {
        return ["name":self.name, "number":self.number]
    }
    
    init?(from snap: DataSnapshot) {
        guard let values = snap.value as? [String:String],
            let name = values["name"],
            let number = values["number"] else { return nil }
        
        self.name = name
        self.number = number
        self.uid = snap.key
    }
}
