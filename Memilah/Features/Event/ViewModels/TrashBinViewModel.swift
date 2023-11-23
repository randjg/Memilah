//
//  TrashBinViewModel.swift
//  Memilah
//
//  Created by Eric Prasetya Sentosa on 12/11/23.
//

import Foundation
import UIKit


class TrashBinViewModel: ObservableObject {
    //    @Published var trashBins: [TrashBinModel] = []
    @Published var trashBin = TrashBinModel() // trash bin intext field
    var imagePath = ""
    
    func addTrashBin(event: EventModel, imageData: Data?, trashBinID: String?) async throws {
        // update the event's trahsbins
        guard let eventID = event.documentID else { return }
        guard let trashBinID = trashBinID else { return }
        if trashBinID.isEmpty { return }
        var updatedEvent = event
        if (updatedEvent.trashBins != nil) {
            updatedEvent.trashBins?.append(trashBinID)
            // Update the event in Firestore
            EventManager.shared.updateEventTrashBins(documentID: eventID, trashBins: updatedEvent.trashBins)
        }
        
        if let imageData = imageData {
            try await uploadImage(data: imageData)
            DispatchQueue.main.async {
                self.trashBin.imageUrl = self.imagePath
            }
        }
        
        DispatchQueue.main.async {
            self.trashBin.event = eventID
            // Update the trash bin in Firestore
            TrashBinManager.shared.updateTrashBin(documentID: trashBinID, newTrashBin: self.trashBin)
        }
    }
    
    func uploadImage(data: Data) async throws {
        let (path, _) = try await StorageManager.shared.saveTrashBinImage(data: data)
        self.imagePath = path
    }
    
    func getImage(imagePath: String, completion: @escaping (Data?) -> Void) {
        StorageManager.shared.getImage(imagePath: imagePath) { imageData in
            completion(imageData)
        }
    }
    
    //    func getImage(imagePath: String) async throws -> Data {
    //        let data = try await StorageManager.shared.getImage(imagePath: imagePath)
    //
    //        return data
    //    }
    
    func validateEmptyFields() -> Bool {
        //        guard let name = trashBin.name else {return false}
        //        guard let detail = trashBin.detail else {return false}
        return trashBin.name.isEmpty || trashBin.detail.isEmpty 
    }
    
    func getTrashBins() async throws -> [TrashBinModel] {
        return try await TrashBinManager.shared.getFreeTrashBins()
    }
    
    func getEvenTrashBins(eventID: String) async throws -> [TrashBinModel] {
        return try await TrashBinManager.shared.getEventTrashBins(eventID: eventID)
    }
    
}
