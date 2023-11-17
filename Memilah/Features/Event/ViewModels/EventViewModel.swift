//
//  EventViewModel.swift
//  Memilah
//
//  Created by Eric Prasetya Sentosa on 09/11/23.
//

import Foundation


class EventViewModel: ObservableObject {
    @Published var event: EventModel = EventModel()
    @Published var nameIsExist = false
    @Published var events = [EventModel]()
    
    @discardableResult
    func getEvents() async throws -> [EventModel]{
        events = try await EventManager.shared.getEvents()
        return events
    }
    
    
    func deleteEvent(documentID: String){
        // delete event in local events
        if let index = events.firstIndex(where: { $0.documentID == documentID }) {
            events.remove(at: index)
        }
        // delete in firestore
        EventManager.shared.deleteEvent(documentID: documentID)
    }
    
    func validateEventName() async -> Bool {
        do {
            let event = try await EventManager.shared.searchEvent(eventName: event.name)
            return event == nil
        } catch {
            print(error)
            return false
        }
    }

    func addEvent(location: String) {
        Task {
            let isValid = await validateEventName()

            if isValid {
                nameIsExist = false
                event.location = location
                
                EventManager.shared.addEvent(event: event)
            } else {
                nameIsExist = true
            }
        }
    }

    func updateEvent(eventToEditName: String, location: String) {
        guard let documentID = event.documentID else {return}
        event.location = location
        if eventToEditName == event.name {
            nameIsExist = false
            EventManager.shared.updateEvent(documentId: documentID, newEvent: event)
        } else {
            Task {
                let isValid = await validateEventName()
                
                if isValid {
                    nameIsExist = false
                    EventManager.shared.updateEvent(documentId: documentID, newEvent: event)
                } else {
                    nameIsExist = true
                }
            }
        }
    }
    
    
    func validateEmptyFields() -> Bool {
        return event.name.isEmpty || event.description.isEmpty
    }
}
