//
//  FireManager.swift
//  Firebase122
//
//  Created by mac on 1/17/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
import FirebaseDatabase


struct FireManager {
    
    
    static let ref = Database.database()
    static let peopleRef = ref.reference(withPath: "people")
    
    
    
    //MARK: Getters
    static func getPeople(completion: @escaping ([Person]) -> Void) {
        
        peopleRef.observeSingleEvent(of: .value) { snapshot in
            var people = [Person]()
            for snap in snapshot.children {
                let data = snap as! DataSnapshot
                if let person = Person(from: data) {
                    people.append(person)
                }
            }
            completion(people)
            print("Retrieved Fire People: \(people.count)")
        }
    }
    
    
    //MARK: Setters
    
    static func savePerson(_ person: Person) {
//        peopleRef.child(uid).setValue(person.name, forKey: "name")
//        peopleRef.child(uid).setValue(person.number, forKey: "number")
        peopleRef.child(person.uid).setValue(person.toDict)
        print("Saved Person To Fire: \(person.name)")
    }
    
    
    //MARK: Delete
    static func delete(_ person: Person) {
        peopleRef.child(person.uid).removeValue()
        print("Deleted Person From Fire: \(person.name)")
    }
}
