//
//  EventViewModel.swift
//  Segrebox
//
//  Created by Eric Prasetya Sentosa on 09/11/23.
//

import Foundation


class EventViewModel: ObservableObject {
//    @Published var name: String = ""
//    @Published var description: String = ""
//    @Published var dateEnd: Date = Date()
//    @Published var dateStart: Date = Date()
//    @Published var trashBins: [String] = []
    @Published var event: EventModel = EventModel()
    @Published var nameIsExist = false
    
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
//                let event = EventModel(name: name, description: description, location: location, dateEnd: dateEnd, dateStart: dateStart)
                event.location = location
                EventManager.shared.addEvent(event: event)
            } else {
                nameIsExist = true
            }
        }
    }

    
    func validateEmptyFields() -> Bool {
        return event.name.isEmpty || event.description.isEmpty
    }
    
//    func validateEventName() async throws {
//        Task {
//            do {
//                let event = try await EventManager.shared.searchEvent(eventName: name)
//                if event == nil {
//                    nameIsExist = false
//                } else {
//                    nameIsExist = true
//                }
//            } catch {
//                print(error)
//            }
//        }
//    }
    
}
