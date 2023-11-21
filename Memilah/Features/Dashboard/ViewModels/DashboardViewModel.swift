////
////  DashboardViewModel.swift
////  Memilah
////
////  Created by Eric Prasetya Sentosa on 11/11/23.
////
//
//import Foundation
//import Firebase
//
//final class DashboardViewModel: ObservableObject {
////    @Published var events: [EventModel] = []
//    @Published var dateStart: Date = Date()
//    @Published var eventStatus: eventStatus = .upcoming
//    @Published var events = [EventModel]()
//    
//    @discardableResult
//    func getEvents() async throws -> [EventModel]{
//        events = try await EventManager.shared.getEvents()
//        return events
//    }
//    
//    
//    func deleteEvent(documentID: String){
//        // delete event in local events
//        if let index = events.firstIndex(where: { $0.documentID == documentID }) {
//            events.remove(at: index)
//        }
//        
//        // delete in firestore
//        EventManager.shared.deleteEvent(documentID: documentID)
//    }
//    
//}
//
