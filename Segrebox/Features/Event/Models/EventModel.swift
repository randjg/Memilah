//
//  EventModel.swift
//  Segrebox
//
//  Created by Eric Prasetya Sentosa on 10/11/23.
//

import Foundation

struct EventModel: Codable {
    var documentID: String?
    var name: String
    var description: String
    var location: String
    var dateEnd: Date
    var dateStart: Date
    var trashBins: [String]?
    
    init(documentID: String? = nil, name: String, description: String, location: String, dateEnd: Date, dateStart: Date, trashBins: [String]? = nil) {
        self.documentID = documentID
        self.name = name
        self.description = description
        self.location = location
        self.dateEnd = dateEnd
        self.dateStart = dateStart
        self.trashBins = trashBins
    }
}
