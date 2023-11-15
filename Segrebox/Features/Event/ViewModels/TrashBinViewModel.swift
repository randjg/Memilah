//
//  TrashBinViewModel.swift
//  Segrebox
//
//  Created by Eric Prasetya Sentosa on 12/11/23.
//

import Foundation
import UIKit


class TrashBinViewModel: ObservableObject {
    @Published var trashBins: [TrashBinModel] = []
//    @Published var trashBins: [TrashBinModel] = []
//    @Published var selectedTrashBin = TrashBinModel() // trash bin to be edited (chosen in picker)
    @Published var trashBin = TrashBinModel() // trash bin intext field
    var imagePath = ""
    func addTrashBin(event: EventModel, imageData: Data?, trashBinID: String?) {
        // update the event's trahsbins
        guard let eventID = event.documentID else { return }
        guard let trashBinID = trashBinID else { return }
        var updatedEvent = event
        updatedEvent.trashBins?.append(trashBinID)
        
        
        // Update the event in Firestore
        EventManager.shared.updateEvent(documentId: eventID, newEvent: updatedEvent)
        
        Task {
            do {
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
            } catch {
                // Handle the error appropriately
                print("Error adding trash bin: \(error.localizedDescription)")
            }
        }
    }
    
    func uploadImage(data: Data) async throws {
        let (path, _) = try await StorageManager.shared.saveTrashBinImage(data: data)
        self.imagePath = path
    }
    
    func getImage(imagePath: String, completion: @escaping (UIImage?) -> Void) {
        StorageManager.shared.getImage(imagePath: imagePath) { image in
            completion(image)
        }
    }
    
    func validateEmptyFields() -> Bool {
        return trashBin.name.isEmpty || trashBin.detail.isEmpty
    }
    
    func getTrashBins() async throws -> [TrashBinModel] {
        return try await TrashBinManager.shared.getFreeTrashBins()
    }
    
}
