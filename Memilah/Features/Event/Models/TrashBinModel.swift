//
//  TrashBinModel.swift
//  Memilah
//
//  Created by Eric Prasetya Sentosa on 12/11/23.
//

import Foundation
import FirebaseFirestore
struct TrashBinModel : Hashable, Codable {
//    var id = UUID()
    @DocumentID var documentID: String?
    var name: String
    var detail: String
    var imageUrl: String
    var latitude: Double?
    var longitude: Double?
    var levelOthers: Double?
    var levelPlastic: Double?
    var levelPaper: Double?
    var objectDetected: Bool?
    var event: String?
    var detectionResult: String?
    var timeUpdated: Date?
    
    enum CodingKeys: String, CodingKey {
       case documentID
       case name
       case detail
       case imageUrl
       case latitude
       case longitude
       case levelOthers
       case levelPlastic
       case levelPaper
       case objectDetected
       case event
       case detectionResult = "detection-result"
       case timeUpdated
   }
    
    init(documentID: String, name: String, detail: String, imageUrl: String, latitude: Double? = nil, longitude: Double? = nil, levelOthers: Double? = nil, levelPlastic: Double? = nil, levelPaper: Double? = nil, objectDetected: Bool? = nil, event: String? = nil, detectionResult: String? = nil, timeUpdated: Date? = nil) {
        self.documentID = documentID
        self.name = name
        self.detail = detail
        self.imageUrl = imageUrl
        self.latitude = latitude
        self.longitude = longitude
        self.levelOthers = levelOthers
        self.levelPlastic = levelPlastic
        self.levelPaper = levelPaper
        self.objectDetected = objectDetected
        self.event = event
        self.detectionResult = detectionResult
        self.timeUpdated = timeUpdated
    }
    
    init() {
        self.documentID = ""
        self.name = ""
        self.detail = ""
        self.imageUrl = ""
        self.latitude = 0.0
        self.longitude = 0.0
        self.levelOthers = 0.0
        self.levelPlastic = 0.0
        self.levelPaper = 0.0
        self.objectDetected = false
        self.event = ""
        self.timeUpdated = Date()
    }
}
