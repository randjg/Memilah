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
    @Published var selectedTrashBin = TrashBinModel()
    @Published var trashBin = TrashBinModel()
    
    func addTrashBin(event: EventModel) {
//        guard let selectedTrashBin = selectedTrashBin else {return}
        
        // update the event's trahsbins
        guard let eventID = event.documentID else {return}
        var updatedEvent = event
        updatedEvent.trashBins?.append(selectedTrashBin.documentID!)
        EventManager.shared.updateEvent(documentId: eventID, newEvent: updatedEvent)
        
        // add trashbin to firestore
        trashBin.event = eventID
        DispatchQueue.main.async {
            TrashBinManager.shared.updateTrashBin(documentID: self.selectedTrashBin.documentID!, newTrashBin: self.trashBin)
        }
    }
    
    func validateEmptyFields() -> Bool {
        return trashBin.name.isEmpty || trashBin.detail.isEmpty
    }
    
    func getTrashBins() {
        Task {
            do {
                let bins = try await TrashBinManager.shared.getFreeTrashBins()
                
                DispatchQueue.main.async {
                    // Update the published property on the main thread
                    self.trashBins = bins
                    guard let selectedTrashBin = bins.first else {return}
                    self.selectedTrashBin = selectedTrashBin
                }
            } catch {
                // Handle the error appropriately
                print("Error fetching trash bins: \(error.localizedDescription)")
            }
        }
    }

}
