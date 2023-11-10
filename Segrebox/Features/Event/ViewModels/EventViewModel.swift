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
        EventManager.shared.addEvent(name: name, description: description, location: location, dateEnd: dateEnd, dateStart: dateStart, trashBins: trashBins)
    }
    
}
