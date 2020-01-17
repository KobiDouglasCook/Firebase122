//
//  AppDelegate.swift
//  Firebase122
//
//  Created by mac on 1/17/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure() //initialize firebase
        return true
    }
    
    

}

