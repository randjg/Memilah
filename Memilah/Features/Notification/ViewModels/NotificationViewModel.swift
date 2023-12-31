//
//  NotificationViewModel.swift
//  Memilah
//
//  Created by Eric Prasetya Sentosa on 22/11/23.
//
import Foundation


class NotificationViewModel: ObservableObject {
    @Published var notifications = [NotificationModel]()
    
//    @discardableResult
    func getNotifications() async throws {
        notifications = try await NotificationManager.shared.getNotifications()
        notifications.sort { $0.dateCreated > $1.dateCreated }
//        return notifications
    }
    
    func realtimeUpdateNotif() {
        NotificationManager.shared.dbRef.addSnapshotListener { querySnapshot, error in
            guard let snapshot = querySnapshot else {
                  print("Error fetching snapshots: \(error!)")
                  return
            }
            snapshot.documentChanges.forEach { documentChange in
                  if (documentChange.type == .added) {
                      do {
                          let notification = try documentChange.document.data(as: NotificationModel.self)
                          self.notifications.insert(notification, at: 0)
                      } catch {
                            print(error)
                      }
                  }
            }
        }
    }
    
    init() {
        realtimeUpdateNotif()
    }
    
}
