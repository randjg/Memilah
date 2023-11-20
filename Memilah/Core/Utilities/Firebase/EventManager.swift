//
//  EventManager.swift
//  Memilah
//
//  Created by Eric Prasetya Sentosa on 09/11/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class EventManager {
    static let shared = EventManager()
    private let dbRef = Firestore.firestore().collection("events")
    
    func addEvent(event: EventModel) {
        do {
            try dbRef.document().setData(from: event)
        } catch {
            print(error)
        }
    }
    
    func deleteEvent(event: EventModel) {
        if let trashBins = event.trashBins {
            for trashBin in trashBins {
                TrashBinManager.shared.refreshTrashBin(documentID: trashBin)
            }
        }
        dbRef.document(event.documentID!).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
    }
    
    private func eventAlreadyEnded(dateEnd: Date ) -> Bool{
        let sameDay = Calendar.current.isDate(Date(), equalTo: dateEnd, toGranularity: .day)
        if dateEnd < Date() && sameDay == false{
            return true
        }
        return false
    }
    func getEvents() async throws -> [EventModel] {
        var events: [EventModel] = []
        let snapshot = try await dbRef.getDocuments()
        for document in snapshot.documents {
            let event = try document.data(as: EventModel.self)
            if eventAlreadyEnded(dateEnd: event.dateEnd) {
                deleteEvent(event: event)
            } else {
                events.append(event)
            }
        }
        
        return events
    }
    
    func updateEvent(documentId: String, newEvent: EventModel) {
        let event = dbRef.document(documentId)
        
        do {
            try event.setData(from: newEvent)
        } catch {
            print(error)
        }
    }
    
    func updateEventTrashBins(documentID: String, trashBins: [String]) {
        let event = dbRef.document(documentID)
        
        event.updateData([
            "trashBins": trashBins
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
    
    func searchEvent(eventName: String) async throws -> EventModel? {
        let snapshot = try await dbRef.whereField("name", isEqualTo: eventName).getDocuments()
        let document = snapshot.documents.first
        
        guard let document = document else {
            return nil
        }
        let event = try document.data(as: EventModel.self)
        
//        event.documentID = document.documentID
        
        return event
    }
}
