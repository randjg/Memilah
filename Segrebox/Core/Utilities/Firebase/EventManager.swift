//
//  EventManager.swift
//  Segrebox
//
//  Created by Eric Prasetya Sentosa on 09/11/23.
//

import Foundation
import FirebaseFirestore

final class EventManager {
    static let shared = EventManager()
    private let db = Firestore.firestore()
    
    @discardableResult
    func addEvent(name: String, description:String, location: String ,dateEnd: Date, dateStart: Date, trashBins:[String]) -> DocumentReference{
        let addedEvent = db.collection("events").addDocument(data: [
            "name" : name,
            "description" : description,
            "location" : location,
            "dateEnd" : Timestamp(date: dateEnd),
            "dateStart" : Timestamp(date: dateStart),
            "trashBins" : trashBins
        ])
        return addedEvent
    }
}
