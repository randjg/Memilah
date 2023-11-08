//
//  Alerts.swift
//  Segrebox
//
//  Created by Eric Prasetya Sentosa on 07/11/23.
//

import SwiftUI

struct Alerts {
    static let incorrectPassword = Alert(
        title: Text("Incorrect Password"),
        message: Text("The password you entered is not same with password confirmation. Please try again."),
        dismissButton: .default(Text("OK"))
    )
    
    static let errorRegister = Alert(
        title: Text("Register Error"),
        message: Text("The email is not valid. Please try again."),
        dismissButton: .default(Text("OK"))
    )
    
    static let invalidCredentials = Alert(
        title: Text("Invalid Credentials"),
        message: Text("The email or password is not valid. Please try again."),
        dismissButton: .default(Text("OK"))
    )
    
}
