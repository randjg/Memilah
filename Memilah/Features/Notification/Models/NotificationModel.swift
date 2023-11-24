//
//  NotificationModel.swift
//  Memilah
//
//  Created by Eric Prasetya Sentosa on 22/11/23.
//

import Foundation
import FirebaseFirestore

struct NotificationModel: Codable {
    @DocumentID var documentID: String?
    var title: String
    var description: String
    var dateCreated: Date
}

extension NotificationModel {
    static let dummy = NotificationModel(
        title: "Fill Level Alert",
        description: "The bins at Pintu Selatan 2 has not received an update for more than 30 minutes",
        dateCreated: Date()
    )
}
