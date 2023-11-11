//
//  DashboardViewModel.swift
//  Segrebox
//
//  Created by Eric Prasetya Sentosa on 11/11/23.
//

import Foundation

final class DashboardViewModel: ObservableObject {
    @Published var events: [EventModel] = []
    
    func getEvents() async throws{
        events = try await EventManager.shared.getEvents()
    }
}
