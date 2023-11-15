//
//  DashboardViewModel.swift
//  Memilah
//
//  Created by Eric Prasetya Sentosa on 11/11/23.
//

import Foundation
import Firebase

final class DashboardViewModel: ObservableObject {
//    @Published var events: [EventModel] = []
    @Published var dateStart: Date = Date()
    @Published var eventStatus: eventStatus = .upcoming
    
    func getEvents() async throws -> [EventModel]{
        let events = try await EventManager.shared.getEvents()
        return events
    }
    
}

