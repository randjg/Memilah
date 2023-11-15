//
//  DashboardViewModel.swift
//  Memilah
//
//  Created by Eric Prasetya Sentosa on 11/11/23.
//

import Foundation
import Firebase

final class DashboardViewModel: ObservableObject {
    @Published var events: [EventModel] = []
    @Published var dateStart: Date = Date()
    @Published var eventStatus: eventStatus = .upcoming
    
    func getEvents() async throws {
        events = try await EventManager.shared.getEvents()
//        return events
//        compareDate()
    }
    
    func compareDate() {
        let currentDate = Date()

        for event in events {
            if currentDate >= event.dateStart && currentDate <= event.dateEnd {
                    eventStatus = .onGoing
                    return
                }
        }
        eventStatus = .upcoming
    }
}

