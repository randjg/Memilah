//
//  TrashBinModel.swift
//  Segrebox
//
//  Created by Eric Prasetya Sentosa on 12/11/23.
//

import Foundation

struct TrashBinModel : Hashable, Codable {
//    var id = UUID()
    var documentID: String?
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
    
//    var tag: String {
//        return documentID ?? id.uuidString
//    }
    
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
   }
    
    
    init() {
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
    }
}
