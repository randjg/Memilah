//
//  UserModel.swift
//  Memilah
//
//  Created by Eric Prasetya Sentosa on 07/11/23.
//

import Foundation
import FirebaseAuth

struct UserModel {
    let uid: String
    let email: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
    }
}
