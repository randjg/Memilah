//
//  NotificationManager.swift
//  Memilah
//
//  Created by Eric Prasetya Sentosa on 22/11/23.
//

import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

final class NotificationManager {
    static let shared = NotificationManager()
    let dbRef = Firestore.firestore().collection("notifications")
    
    func getNotifications() async throws -> [NotificationModel] {
        var notifications = [NotificationModel]()
        let snapshot = try await dbRef.getDocuments()
        for document in snapshot.documents {
            let notification = try document.data(as: NotificationModel.self)
            notifications.append(notification)
        }
        return notifications
    }
    
}
