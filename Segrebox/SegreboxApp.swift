//
//  SegreboxApp.swift
//  Segrebox
//
//  Created by Randy Julian on 21/10/23.
//

import SwiftUI
import Firebase

@main
struct SegreboxApp: App {
    init() {
        FirebaseApp.configure()
        print("Configured Firebase!")
    }
    var body: some Scene {
        WindowGroup {
            TestViewEvent()
        }
    }
}
