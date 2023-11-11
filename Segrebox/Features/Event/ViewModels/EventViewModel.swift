//
//  EventViewModel.swift
//  Segrebox
//
//  Created by Eric Prasetya Sentosa on 09/11/23.
//

import Foundation


class EventViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var description: String = ""
    @Published var dateEnd: Date = Date()
    @Published var dateStart: Date = Date()
    @Published var trashBins: [String] = []
    
    func addEvent(location: String) {
        let event = EventModel(name: name, description: description, location: location, dateEnd: dateEnd, dateStart: dateStart)
        EventManager.shared.addEvent(event: event)
        Task {
            do {
                let events = try await EventManager.shared.getEvents()
                print(events)
            } catch {
                print(error)
            }
        }
    }
    
    func validateEmptyFields() -> Bool {
        return name.isEmpty || description.isEmpty
    }
    
}
